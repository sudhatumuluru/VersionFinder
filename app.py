from flask import Flask, render_template
import subprocess

finder=Flask(__name__)

@finder.route("/")
def main_page():
    return render_template('index.html')

@finder.route('/<string:instance>',methods=['GET'])
def fetch_version(instance):
    #output = subprocess.check_output(['sh version_finder.sh', instance])
    output = subprocess.check_output(['pwd'])
    return render_template('index.html', instance_version = output)

if __name__=="__main__":
    finder.run()

