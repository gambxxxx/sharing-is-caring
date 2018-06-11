from troposphere import (
    Base64,
    ec2,
    GetAtt,
    Join,
    Output,
    Parameter,
    Ref,
    Template,
)
ApplicationPort=3000
t = Template()
t.add_description("Effective DevOps in AWS: HelloWorld web application")
