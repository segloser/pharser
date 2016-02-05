# pharser
Just a test to implement an idea of one of my supervisors - Phishing detection through hash comparison

SOME FILES HAVE BEEN OMITTED ON PURPOSE SINCE THEY CONTAIN CLIENT INFORMATION. THIS VERSION WILL NOT PROPERLY WORK

=============================
The purpose of this tool is to extract emails from an emails manager or client, parse any URL included in the
email, download the destination page of that URL and hash it according to ssdeep.

After that, using a simple approach, since this is just a draft, nor for production, a white-list of 
URLs are also downloaded and hashed with ssdeep.

If there is a match between hashes (pages downloaded from URL included in emails and white-listed pages),
we would review the case, in order to find possible malicious intents.

In this specific case, we have chosen IceDove (ThunderBird) in the last Kali Linux Version.

We have used a script written by Mari DeGrazia as a point to start, since this Thunderbird-Email-Parser
perfectly does the first stage of our task, that is to say, the email parsing (and much more, but we 
are not going to need it for the moment).

With the parsed emails, we apply a simple and incomplete regular expression criteria to find URL 
inserted in the parsed emails.

Once those URLs are extracted, we download their content and we hash it.

After that, our white URLs are also downloaded and hashed.

The hashes are compared. When a match takes place, the hashes are stored in a TXT file named <matches.txt>.

Simultaneously, a number of files are also created in the main path. Most of them are used as a middle step
for subsequent processes. Others are useful information stored for a more serious development of this draft.

=================
HOW TO USE IT
=================
A bash scritp has been written to create the directory arquitecture needed for testing this tool (since it 
is specific and it will not work otherwise). The bash script also download the necessary files in 
the correct place.

Theoretically, just running the bash script would start the preparation of the computer, and the tool itself.

For further tests, reading the code would be enough to understand how this works.

However, the proper syntax to run <pharser.py> is identical to run the Maria DeGrazia parser:

python pharser.py -d /root/pharser/joint/bulk_mails/ -o ./parsed

====================
NAME OF THE TOOL
====================
pharser is a name resulting of Phishing + Parser. Indeed, it is not more than a phishing detector, based on
parsing and hashing comparison.
The efficiency of this tool highly rely on the hability to gather good phishing emails, so time, luck and
a great dose of creativity will be needed for a successful employment of this tool.




