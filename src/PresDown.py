from string import Template
import markdown

def convert_to_html(infile,outfile):
    output = get_html(infile)
    open(outfile, 'w').write(output)
    
def parse_presentation_file(filename):
    html = markdown.markdown(open(filename, 'r').read())
    
    html = html.replace("<h1>","<li class=\"slide\"><h1 >",1)
    html = html.replace("<h1>","</li><li class=\"slide\"><h1>")
    
    html = html + "</li>"
    
    return html

def get_html(filename):
    html = parse_presentation_file(filename)
    
    output = template.substitute(presentation = html, 
                                 title = "", 
                                 js = js, 
                                 css = css)
    return output
