Feature: Valid Fields and HTTP redirection
        HTTP should redirect to HTTPS


Background:
  Given Submit a ticket form is "https://jive.com/resources/support/submit-a-ticket"
    And Set basic contact info as "<variable_name>" and "<value>" below
    |variable_name    | value                                                                               |
    |good_name        | John Doe                                                                            |
    |bad_name         | ThisisaverylongstringtomakethetctofailThisisaverylongstringtomakethetctofailenough23|
    |french_name      | Benoît Eugène Anaïs Zoé Laëtitia                                                    |
    |good_email       | stomv@live.com                                                                      |
    |bad_email1       | idontthink.thisisavalidemail                                                        |
    |bad_email2       | kobayasi@mobile.c                                                                   |
    |long_email       | kobayasi@abcdefghijklmnopqrstuuvxyzabcdefghijklmnopqrstuuvxyzabcdefghijklmnopqrs.com|
    |good_company_name| logmein                                                                             |
    |bad_company_name | ThisisaverylongstringtomakethetctofailThisisaverylongstringtomakethetctofailenough23|
    |good_phone       | +1 514 123 4567                                                                     |
    |bad_phone        | +1 abc def ghij                                                                     |
    |long_phone       | 123456789012345678901234567890123456789012345678901234567890123456789012345678901234|
    |good_subject     | This is a Test, please ignore                                                       |
    |bad_subject      | ThisisaverylongstringtomakethetctofailThisisaverylongstringtomakethetctofailenough23|
    |message          | This is a test message, please ignore, thanks                                       |

Scenario: All valid values in the form
  Given Opening the Submit a Ticket web page
  When  Enter "good_name" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: HTTP Redirect to HTTPS
  Given The HTTP submit a ticket form is "http://jive.com/resources/support/submit-a-ticket"
    And Send a GET request to this url
  Then There will be two re-directions in the response
    And The redirect link is "https://jive.com/resources/support/lets-talk/submit-a-ticket/"