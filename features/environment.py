from selenium import webdriver

def before_all(context):
    context.browser = webdriver.Chrome(executable_path="chromedriver.exe")

def after_all(context):
    context.browser.quit()
