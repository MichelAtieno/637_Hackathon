from pyresparser import ResumeParser
import os
from docx import Document

filed="CV.df"
print(filed)
try:
    doc = Document()
    with open(filed, 'r', encoding="utf-8") as file:
        doc.add_paragraph(file.read())
        print(filed)
    doc.save("text.docx")
    data = ResumeParser('text.docx').get_extracted_data()
    print(data['skills'])
except:
    data = ResumeParser(filed).get_extracted_data()
    print(data['skills'])