*** Settings ***
Documentation        Gerenciando a Massa de Testes através do
...                  Banco de dados!

Library    DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database        psycopg2
    ...                        kkruezpx
    ...                        kkruezpx
    ...                        PJJlIWV3pNePFd-jW53vdn1Ps-MhTGLj 
    ...                        babar.db.elephantsql.com
    ...                        5432

Select Student Where Email
    [Arguments]    ${email}
    
    ${query}       Set Variable
    ...            SELECT * FROM public.students WHERE email= '${email}';

    ${result}      Query       ${query} 

    Log            Retorno da Query: ${result}[0]

    [Return]       ${result}[0]
    
Delete Enroll By Email
    [Arguments]    ${email}

    ${user}        Select Student Where Email    ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.enrollments WHERE student_id = ' ${user}[0]';    

    Execute SQL String    ${query}

Delete Student By Email
    [Arguments]    ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.students WHERE email = '${email}';

    Execute SQL String    ${query}

# Helpers!
Reset Student
    [Arguments]    ${email}

    Connect To Postgres
    Delete Student By Email    ${email}
    Disconnect From Database