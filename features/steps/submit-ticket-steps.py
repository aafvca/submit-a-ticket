from behave import given,when,then
import requests

global_general_variables = {}

@given(u'Submit a ticket form is "{form_url}"')
def step_impl(context,form_url):
    global_general_variables['form_url'] = form_url

@given(u'Set basic contact info as "{variable_name}" and "{value}" below')
def step_impl(context, variable_name, value):
    for row in context.table:
        temp_value = row['value']
        global_general_variables[row['variable_name']] = temp_value
        if 'empty' in temp_value:
            global_general_variables[row['variable_name']] = ''

@given(u'Opening the Submit a Ticket web page')
def step_impl(context):
    url = global_general_variables['form_url']
    context.browser.get(url)

@when(u'Empty value in "{field}"')
def step_impl(context,field):
    if field == "Name":
        context.browser.find_element_by_id("name").clear()
    elif field == "Email":
        context.browser.find_element_by_id("email").clear()
    elif field == "Company Name":
        context.browser.find_element_by_id("company").clear()
    elif field == "Best Contact Number":
        context.browser.find_element_by_id("phone").clear()
    elif field == "Subject of Issue":
        context.browser.find_element_by_id("subject").clear()
    elif field == "Message":
        context.browser.find_element_by_xpath("//*[@id='ticketForm']/div[6]/textarea").clear()

@then(u'Click in "Submit Ticket" button')
def step_impl(context):
    context.browser.find_element_by_id("ticketBtn").click()

@when(u'Enter "{variable_name}" value in "{field}"')
def step_impl(context,variable_name,field):
    if field == "Name":
        name = global_general_variables[variable_name]
        context.browser.find_element_by_id("name").send_keys(name)
    if field == "Email":
        email = global_general_variables[variable_name]
        context.browser.find_element_by_id("email").send_keys(email)
    if field == "Company Name":
        company = global_general_variables[variable_name]
        context.browser.find_element_by_id("company").send_keys(company)
    if field == "Best Contact Number":
        phone = global_general_variables[variable_name]
        context.browser.find_element_by_id("phone").send_keys(phone)
    if field == "Subject of Issue":
        subject = global_general_variables[variable_name]
        context.browser.find_element_by_id("subject").send_keys(subject)
    if field == "Message":
        message = global_general_variables[variable_name]
        context.browser.find_element_by_xpath("//*[@id='ticketForm']/div[6]/textarea").send_keys(message)

@then(u'Errors in "{field}" field should be received')
def step_impl(context,field):
    if field == "Name":
        if not (context.browser.execute_script("return document.querySelector('#name.error')")):
            assert False, '***ERROR: Name field did not returned an error'
    elif field == "Email":
        if not (context.browser.execute_script("return document.querySelector('#email.error')")):
            assert False, '***ERROR: Email field did not returned an error'
    elif field == "Company Name":
        if not (context.browser.execute_script("return document.querySelector('#company.error')")):
            assert False, '***ERROR: Company field did not returned an error'
    elif field == "Best Contact Number":
        if not (context.browser.execute_script("return document.querySelector('#phone.error')")):
            assert False, '***ERROR: Best Contact Number field did not returned an error'
    elif field == "Subject of Issue":
        if not (context.browser.execute_script("return document.querySelector('#subject.error')")):
            assert False, '***ERROR: Subject of Issue field did not returned an error'
    elif field == "Message":
        if not (context.browser.execute_script("return document.querySelector('textarea.error')")):
            assert False, '***ERROR: Message field did not returned an error'

@then(u'No errors in "{field}" field should be received')
def step_impl(context,field):
    if field == "Name":
        if (context.browser.execute_script("return document.querySelector('#name.error')")):
            assert False, '***ERROR: Name field returned an error'
    elif field == "Email":
        if (context.browser.execute_script("return document.querySelector('#email.error')")):
            assert False, '***ERROR: Email field returned an error'
    elif field == "Company Name":
        if (context.browser.execute_script("return document.querySelector('#company.error')")):
            assert False, '***ERROR: Company field returned an error'
    elif field == "Best Contact Number":
        if (context.browser.execute_script("return document.querySelector('#phone.error')")):
            assert False, '***ERROR: Best Contact Number field returned an error'
    elif field == "Subject of Issue":
        if (context.browser.execute_script("return document.querySelector('#subject.error')")):
            assert False, '***ERROR: Subject of Issue field returned an error'
    elif field == "Message":
        if (context.browser.execute_script("return document.querySelector('textarea.error')")):
            assert False, '***ERROR: Message field returned an error'

@given(u'The HTTP submit a ticket form is "{http_url}"')
def step_impl(context,http_url):
    global_general_variables['http_url'] = http_url

@given(u'Send a GET request to this url')
def step_impl(context):
    url_temp = global_general_variables['http_url']
    global_general_variables['response_full'] = requests.get(url_temp)

@then(u'There will be two re-directions in the response')
def step_impl(context):
    history = global_general_variables['response_full'].history
    if len(history) != 2:
        assert False, '***ERROR: There is only one or no redirections to the HTTPS site'
    for element in history:
        if str(element) != '<Response [301]>':
            assert False, '***ERROR: The response code is not 301'

@then (u'The redirect link is "{https_url}"')
def step_impl(context,https_url):
    redirect_url = global_general_variables['response_full'].url
    if https_url != redirect_url:
        assert False, '***ERROR: It was not redirected to the site specified'