# Scraper *onliner.by* into *csv* document.

1. We put Capybara.
2. We go with the help of the capybara to the onliner.
3. We get all the news from the page.
4. Save document to csv (news title, link to picture, first 200 characters of text).

# Getting Started 

Before starting the parsing script, we need one more tool - ChromeDriver. Click the following [link](https://chromedriver.storage.googleapis.com/index.html) to download the ChromeDriver.

The latest version of ChromeDrive is 87.0.4280.20, so I'm going to use that version. But that will change in the future. Make sure you are using the latest version, or don't use it. Whatever is convenient for you :).

Download the appropriate version. (I downloaded chromedriver_mac64.zip.) After unpacking the zip file, you will get a binary called chromedriver. You need to copy this file to your $ PATH. You can, for example, copy this file to / usr / bin, / usr / local / bin, or / bin.

**To get a local copy of the repository please run the following commands on your terminal:**

```
$ cd <folder>

$ git clone <url>
```

**To run the code:** 

~~~bash
$ ruby scraper(level2_week3)/run.rb
~~~

# Author 

👤 **Berkovich Pavel**

- Github: [https://github.com/berkovichpavel](https://github.com/berkovichpavel)
- Telegram: [https://t.me/BerkovichPavel](https://t.me/BerkovichPavel)
- Linkedin: [https://www.linkedin.com/in/pavel-berkovich-9844251a4/](https://www.linkedin.com/in/pavel-berkovich-9844251a4/)
