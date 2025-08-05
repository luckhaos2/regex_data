import fastapi
import win32print
import PyPDF2 
import win32api
import os
import shutil
printer = win32print.GetDefaultPrinter()

app = fastapi

@app.get("/imprimir")
async def pdfrestore (file):
  destiny = "C:\Usuários\Jefferson\Documentos\python"
  shutil.copy(file,destino)
  pdf_name = os.path.basename()
  destiny.join('\pdf_name')


def writerpdf(pdf_directory):
   text = PyPDF2._reader(pdf_directory)
   win32api.ShellExecute(0,"print",'text')