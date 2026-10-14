# Alma Letters

Customized XSL letter templates for Ex Libris Alma, forked from [cuny-libraries/alma-letters](https://github.com/cuny-libraries/alma-letters)


## CLI Tool

Alma-letters is a command-line tool to sync letters between your local files and Alma via the Configuration API. It can also serve as the repository for your institutions Alma letter templates.

### Installation

```bash
pipx install .
```

**Important:** After first cloning this repository, delete the contents of the letters and components subfolders, or you risk overwriting your templates with UCSC's.

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

**Download letter templates from Alma:**
```bash
alma-letters pull --env sandbox
alma-letters pull --env production
```

**Upload all templates to Alma:**
```bash
alma-letters push --env sandbox      # Test in sandbox first
alma-letters push --env production   # Requires confirmation
```

**Upload a single template to Alma:**
```bash
alma-letters push --env ENV --letter CODE 		# With any valid letter code
alma-letters push --env ENV --component CODE 	# With and valid component code

# Example: alma-letters push --env production --letter SavedSearchesLetter
```

**View available letters:**
```bash
alma-letters --debug
```

### Configuration Files

- `letters.txt` — Letter codes to sync (one per line)
- `components.txt` — Component codes to sync (one per line)

Lines starting with `#` are comments.

If you do not define the list of templates to download, the tool will default to downloading templates that are both enabled and customized.

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
