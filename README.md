# Alma Letters

Customized XSL letter templates for Ex Libris Alma, forked from [cuny-libraries/alma-letters](https://github.com/cuny-libraries/alma-letters)


## CLI Tool

This repository includes a command-line tool to sync letters between your local files and Alma via the Configuration API.

### Installation

```bash
pipx install .
```

### Configuration

Create a `.env` file from the template:

```bash
cp .env.example .env
```

Add your API keys (read/write access to Configuration API required):

```
ALMA_API_KEY_SANDBOX=your_sandbox_key
ALMA_API_KEY_PRODUCTION=your_production_key
ALMA_REGION=na
```

Available regions: `na`, `eu`, `ap`, `aps`, `ca`, `cn`

### Commands

**Export letters from Alma:**
```bash
alma-letters
```

**Push changes to Alma:**
```bash
alma-letters push --env sandbox      # Test in sandbox first
alma-letters push --env production   # Requires confirmation
```

**View available letters:**
```bash
alma-letters --debug
```

### Configuration Files

- `letters.txt` — Letter codes to sync (one per line)
- `components.txt` — Component codes to sync (one per line)

Lines starting with `#` are comments.


## Resources

### Letters with non-obvious codes
| Letter Code | Letter Name |
| ----------- | ----------- |
| Borrowing Activity Letter | FulUserBorrowingActivityLetter | 
| Courtesy Letter | FulUserLoansCourtesyLetter |
| Loan Receipt Letter | FulLoanReceiptLetter |
| Loan Status Notice | FulItemChangeDueDateLetter |
| On Hold Shelf Letter | FulPlaceOnHoldShelfLetter |
| On Hold Shelf Reminder Letter | FulOnHoldShelfReminderLetter | 
| Overdue Notice Letter | FulUserOverdueNoticeLetter |
| Return Receipt Letter | FulReturnReceiptLetter |

### Identifying a letter code

To get the letter code in Alma, navigate to Configuration > General > Letters Configuration. Then find the letter and click on its title to open the edit screen. Now click on the Letter Examples button near the top of the modal window. If the list only includes "DefaultLetter.xml", then click the Add from system letters button and pick from any option you see. The name of the example in the list (other than DefaultLetter.xml) is the Alma system code for the letter.

### Ex Libris Documentation

- [Letter Customization Guide](https://knowledge.exlibrisgroup.com/Alma/Product_Documentation/010Alma_Online_Help_(English)/050Administration/050Configuring_General_Alma_Functions/070Configuring_Alma_Letters#Using_Templates_to_Update_Letter_Formatting_and_Content)
- [Letter List](https://knowledge.exlibrisgroup.com/Alma/Product_Documentation/010Alma_Online_Help_(English)/050Administration/050Configuring_General_Alma_Functions/070Configuring_Alma_Letters#Letter_List)
- [Automating Letter Exports](https://developers.exlibrisgroup.com/blog/automating-letter-and-code-table-exports-from-alma/)
- [Configuration API](https://developers.exlibrisgroup.com/alma/apis/conf/)

### Community

- [University of Oslo Alma Letters](https://github.com/uio-library/alma-letters-ubo) — Reference implementation
- [Alma User Discussion List](https://exlibrisusers.org/postorius/lists/alma.exlibrisusers.org/)

### Technical

- [XSLT 1.0 Specification](https://www.w3.org/TR/xslt-10/)
- [HTML Email CSS Support](https://www.campaignmonitor.com/css/)
- [WCAG 2.1 Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/)
