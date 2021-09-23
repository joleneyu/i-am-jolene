Title: Save Your AWS Costs by StackJanitor
Date: 2021-09-11 14:04
Modified: 2021-09-11 17:05
Category: open source
Tags: serverless, typescript, unit test  
Slug: open-source-1
Authors: Jolene Yu


Have you ever worried about the costs related to CloudFormation Stacks? I know CloudFormation is basically free, but the resources created by CloudFormation Stacks are NOT! In a commercial development environment, there could be tons of non-used stacks are up and running every day! 

I found an open-source project - StackJanitor which solves this problem easily. It has 2 major mechanisms. 

1. StackJanitor automatically adds all of the CloudFormation stacks that you create in your AWS account to a DynamoDB table. If you have specified a stacktag *stackjanitor* to *enabled*, StackJanitor will add your CloudFormation Stack to DynamoDB, setting a TTL field on it to 7 days (this is the default, but can be changed). When the DynamoDB row expires and deletes the row, a lambda function is then triggered that deletes your stack.

2. StackJanitor can also delete stacks using either a Github or Bitbucket webhook. It uses merged pull request events to trigger the webhook so that they can quickly delete stacks as part of the development workflow.

This open-source project had an open issue of not cleaning up stacks properly sometimes. They require someone to add a fallback mechanism that can remove stacks older than a certain date with the *stackjanitor:enabled* tag on the stack.

To optimise this situation, I recently updated an additional handler to periodically scan and delete old stacks. It's currently under review but I think the outcome is quite cheering. I've learned a lot in this project which I would like to share! [Here is the repo for this project](https://github.com/joleneyu/StackJanitor)

### What I've done:

1. Everything was new to me: Serverless Framework, TypeScript, Compiling, JavaScript, Unit Testing. Even just add one single handler was a huge task for me. So I took my first step to read existing code! But TypeScpirt is an object-oriented programme language that is quite different from Python. Compare to JavaScript, most developers find TS is simpler to work with because of its features of strict data type definition and prompt error message when you are writing code. I hope these features helped me as others which didn't happen! So I took a beginner course in TypeScript.

2. Finally I could write some functions with TypeScript! I started to appreciate the hints it provided and I could adjust my code while I was writing it. After I wrote the optional handler, I started to run the handler to test out with CloudFormation stacks. Everything worked fine at this stage.

3. The next step was unit testing. The concept was fairly easy - you pass variables to the functions you are testing and compare with expecting results with the function results. I had a problem with the last function which performs deleting stacks. The problem is I only want to mock delete actions when I run the tests instead of deleting the real stacks. I used the mocking modular for AWS SDK which uses Sinon.JS to create robust stubs in place of the SDK calls. Unit tests end up perfect.

4. Source code looks great. So I moved on to deploy the Lambda function to AWS. Here I have to modify the "serverless.yml" file to add the additional function. At first, I messed up with the event schedule as I didn't put the right syntax to Cron. (***Learning point*** - Always read through the documentation for what you didn't know!)

5. Okay, the final step would be to tidy up the code and make sure all the changes are necessary by comparing with the base code from Git history! Thank God, I did this, because I found out I accidentally delete the *delete function* in the source code!! I added the lines back but a big question mark raised up of why my unit testing didn't fail? (I did run unit tests before I did this tidy up step.) Then I went back to the test file and spent half a day figuring out the problems:

    - ***ForEach*** function can’t work properly with ***expect*** function
    - Define functions with ***locally scoped variables***. Unit tests won’t pick up globally scoped variables when you only import functions.

Then submit the pull request and all done! 