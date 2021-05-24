"""
Prints "Hello world" using html pulled from a copy of the Pyconline program
page for Sunday. Uses beautiful soup.

BeautifulSoup is imported dynamically.
Requires internet to work.

Does the following:

 - Get html of web page containing guidelines for Rube Codeberg with urllib.
 - Open the source code of this program, to get the name of a module to
   be imported (beautiful soup)
 - Import BeautifulSoup dynamically using importlib
   (thanks to Shivashis' talk)
 - Parse the message to be printed using beautiful soup.
 - Construct AST for a print function call with ast module.
   (thanks to Katie's talk)
 - Convert ast to code object which is then executed.
"""

from typing import List, Tuple
import ast
import importlib
import urllib.request

# from bs4 import BeautifulSoup  # imported dynamically

URL = "https://2020.pycon.org.au/program/sun/"


def get_html(url: str) -> str:
    """Extract html from a url"""
    with urllib.request.urlopen(url) as response:
        bytestr = response.read()
        return bytestr.decode('utf-8')
    return None


def get_bs_name_from_src() -> List[str]:
    """
    Extract the words 'beautiful' and  'soup' from this file and
    return them as a list.
    """
    with open(__file__) as fsrc:
        lines = fsrc.readlines()
        third_line_items = lines[2].split()[-2:]  # ['beautiful', 'soup']
        third_line_items[-1] = third_line_items[-1].replace('.', '')
        return third_line_items


def get_bs_class():
    """Import bs4 dynamically and return BeautifulSoup class"""
    name_list = get_bs_name_from_src()
    mod_name = ''.join(word[0] for word in name_list) + "4"
    class_name = ''.join(word.capitalize() for word in name_list)

    bs4 = importlib.import_module(mod_name)
    return getattr(bs4, class_name)


def get_fn_and_msg(html_str: str) -> Tuple[str, str]:
    """
    Generate function name and extract message from the html string.

    Use the first list item in the unordered list of rules in the page.

    ie,

    ```
    Print "Hello world!" on the screen (somehow - we don't care how
    - doesn't have to be the console) as a result of being executed
    ```
    """
    BeautifulSoup = get_bs_class()
    soup = BeautifulSoup(html_str, "html.parser")
    msg = soup.main.find_all("ul", limit=2)[-1].li.strong.string
    fn_name, msg = msg.split(' ', maxsplit=1)
    fn_name = fn_name.lower()            #  Print -> print
    msg = msg.replace('"', ' ').strip()  #  "Hello world!" -> Hello world!
    return fn_name, msg


def get_code(fn_name_str: str, msg: str):
    """
    Generate AST for

    >>> fn_name_str(msg)    # print("Hello world!")

    and return it as code object
    """
    fn_name = ast.Name(id=fn_name_str, ctx=ast.Load())
    fn_args = ast.Str(s=msg)
    fn_call = ast.Call(func=fn_name, args=[fn_args], keywords=[])
    expr = ast.Expr(value=fn_call)
    module = ast.Module(body=[expr], type_ignores=[])
    ast.fix_missing_locations(module)
    return compile(module, '<ast>', 'exec')


if __name__ == "__main__":
    html_text = get_html(f"http://web.archive.org/web/20200905141404/{URL}")
    func_name, message = get_fn_and_msg(html_text)
    code = get_code(func_name, message)
    exec(code)
