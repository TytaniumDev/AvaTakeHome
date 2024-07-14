# Ava Take Home Project

A new Flutter project.

## Problems in the spec

### General
* Font files weren't provided, so the look of the text won't be quite right. This introduces additional challenges as well, as the heights of symbols vary between fonts, and the Figma spec relies on the height of the symbols for some layouts. Pixel perfect precision couldn't be achieved because of this, but I got as close as I could through guesstimating.

### Home page
* The progress ring in the header seems to be at a mystery value. It should be further along the track if it is showing the progress towards maximum credit score (850), and further back if it is showing the progress within the "Good" score bucket (661-780). I'm assuming it's meant to show progress towards maximum credit score, and went with that implementation instead.

### Employment information page
 * Sept isn't a valid ICU time format (https://unicode-org.github.io/icu/userguide/format_parse/datetime/). I used MMM as it's as close as possible, giving "Sep" instead of "Sept" from the Figma spec. 
 * Ordering of the fields on the Edit employment information and Confirm employment information pages don't match, so I went with the ordering of the Confirm page to allow for nice animations between the two modes like requested ("Bonus points if you make the confirm and edit info screens as one screen.").

## Things I would change
* Localization/Internationlization. Strings would need to go through the intl package.
* Proper Repository architecture that can use a shared interface but have different implementations (local storage, REST API, etc). I didn't have enough time to fully figure out how to do this as I haven't used Riverpod before, but I assume there's a way.