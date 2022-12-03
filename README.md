# Car Factory
## Main Idea

Car Factory is a pet project with the versioning as one of the main features.

In this project I realized my own versioning functionality and tried to follow all great code writing styles.

The main idea of versioning(example on instance of Part class):

1. You have a Part instance;
2. You want to change it, but at the same time you want previously created cars to use the old one part;
3. Instead of update system creates new instance of Part and updates old_part.child(field that shows us what instance was inherited of this part);
4. And generally that's all, but we have 2 more models between cars and parts(CarPattern and CarPatternUnit). 
They use the same logic and if you want to update the part system will automatically update both of these models.
If you want to update the CarPatternUnit system will automatically update its CarPattern.

Mostly that's it.

## Configuration and Versions

Ruby -- 3.0.0;

Rails -- 6.0.6;

## Usage

Its API only application. In the project folder you can find postman json-schema that includes all needed commands to use the app.
