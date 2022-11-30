/**
 * @title Replace html of a page with other html
 * @author Millie Green @5r33n
 * @time 1669797420
 */

function main() {
  /* prompt takes two parameters, both of which are optional
   * 1. message (optional)
   * 2. defaultValue (optional)
   *
   * prompt returns a string containing the text entered by the user, or null.
   */
  const replaceFrom = prompt("Replace: ", "Google")
  const replaceTo = prompt("With: ", "Doodle")

  document.body.innerHTML = document.body.innerHTML.replace(replaceFrom, replaceTo)
}

main()
