# coding: utf-8
import os
import click
import jinja2


here = os.path.dirname(os.path.abspath(__file__))


def Env(root):
    return jinja2.Environment(
        loader=jinja2.FileSystemLoader(root)
    )


@click.group()
def main():
    pass


@main.command()
@click.option("-e", "ext", default=".html")
@click.option("-d", "dst", default=here)
@click.option("-r", "root", default=here)
@click.option("-n", "dry_run", default=False, is_flag=True)
@click.option("-v", "verbose", default=False, is_flag=True)
def make(ext, dst, root, dry_run, verbose):
    for r, d, files in os.walk(root):
        for f in files:
            if f.endswith(ext):
                html = Env(root).get_template(f).render()
                join = os.path.join(dst, f)
                if verbose:
                    click.echo("Create : %s" % join)

                if not dry_run:
                    with open(join, "w") as fh:
                        fh.write(html)


if __name__ == "__main__":
    main()
