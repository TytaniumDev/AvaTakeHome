# Ava Take Home Project

## How to run

Open the [app on the Github Pages deployment](https://tytaniumdev.github.io/AvaTakeHome/)! It's fully responsive!

I kept the generated files checked in, so you should be able to just do a standard `flutter run` from the `ava_take_home` directory!

I only tested on Web, but it should work on Android and iOS as well (and probably Mac OS, Linux, and Windows).

> [!IMPORTANT] 
> Try tapping on the "Home" title to toggle on and off Demo mode, which will have the Repositories start generating random, but sane, data so you can see all of the nice animations!

## Folder Organization

I chose to organize the MVVM structure by layer rather than feature, just because it's easier to browse as a demo project.

This could easily be moved around to organize by feature (home, employment_info, each individual section on the home screen, etc).

## Things I would change
* Localization/Internationlization. Strings would need to go through the intl package. Right now they're all hardcoded in place. This was another big time save, but I used Strings in places where access to a `BuildContext` is easy. I only put plurals in `ui/intl.dart` for now out of necessity.
* Proper Repository architecture that can use a shared interface but have different implementations (local storage, REST API, etc). I didn't have enough time to fully figure out how to do this as I haven't used Riverpod before, but I assume there's a way.
* The last bit of polish on the animations. The text animations jump in location when the length of the text changes. I'd need to do some restructuring to fix this, but just don't have time.
* Work with design/PM to figure out what the logic is for the chart widget. Right now it shows a horizontal line and left hand title every 50 credit score, but that can cause issues if very small or very large credit changes happen over 12 months.
* Custom draw the "Account details" amount to spend marker container instead of using a custom clip.
* Fix the positioning of the autofill suggestions on Web (maybe every platform?) on the edit employment info screen.
* Instead of staticly accessing all of the colors, I should be retrieving them from Theme.of(context) and using ThemeExtensions so in the future Dark mode could be supported, or other OS color styles.
* The Radio buttons in the Edit employment info page don't match spec. I'd make custom ones since theming is limited for the Material implementation.

### Testing
Unfortunately, I did not have enough time to write the tests for everything. I prioritized writing everything in a testable way, and implementing the UI to spec.

Here's what I'd like the test suite to look like, if I had the time to write a LOT more code:
* Integration tests for repositories fetching data.
* Unit tests for ViewModels transforming Model layer data into expected ViewData objects.
* Unit tests for and functions a ViewModel has to ensure the side effects happen.
* Widget tests for the Views to ensure the correct ViewModel functions are being called, and with the data we expect.
* `matchesGoldenFile` Widget tests for the Views to ensure they either directly match a Figma spec PNG, or an existing golden file we'd generate after the first run of the test.
* Some sort of `Storybook.js` type of app to allow for the whole company to easily test individual component rendering.

## Difficulties while interpreting the Figma spec

I wanted to note down areas where the implementation may differ from the [Figma spec provided](https://www.figma.com/design/fgAwUqgFK30hJqYo0byDeG/Untitled?node-id=0-1) and explain what caused the differences.

### General
* Font files weren't provided, so the look of the text won't be quite right. This introduces additional challenges as well, as the heights of symbols vary between fonts, and the Figma spec relies on the height of the symbols for some layouts. Pixel perfect precision couldn't be achieved because of this, but I got as close as I could through guesstimating.

### Home page
* The progress ring in the header seems to be at a mystery value. It should be further along the track if it is showing the progress towards maximum credit score (850), and further back if it is showing the progress within the "Good" score bucket (661-780). I'm assuming it's meant to show progress towards maximum credit score, and went with that implementation instead.
* The total balance and total limit don't match with the actual open credit card accounts. I've added a "Capital One" card to the open credit card accounts to make the numbers work.
* The utilization percentages in the open credit card accounts section are all wrong. They show 21% in Figma, but they should be 23% (rounded down).
* The total balance card circle's starting point isn't at the top center? It's offset a bit, but I'm going to assume that's intentional and match it. 
* The "Credit factors" header wasn't padded properly in the spec, I padded it to match the other headers and have the same styling as the others as well.

#### Ava-specific Account details card
* The Ava-specific Account details card has numbers that don't match up. I assumed that the number in the purple marker above the progress bar was supposed to be how much the user has available to spend, so I changed the balance to make everything line up.
* Both the positioning of the dark green box in the progress bar and the purple available to spend marker don't match where they should be if this bar is showing a percentage from 0 to the credit limit. They should both be much further left if the spending limit is $100 and the credit limit is $600. In the spec, it's shown as if the spending limit is around $200-250 instead of $100. I made both widgets reflect true percentages.
* Due to the above changes and needing to change the value of the balance, the Utilization is also different than the spec's 4%.

### Employment information page
 * Sept isn't a valid ICU time format (https://unicode-org.github.io/icu/userguide/format_parse/datetime/). I used MMM as it's as close as possible, giving "Sep" instead of "Sept" from the Figma spec. 
 * Ordering of the fields on the Edit employment information and Confirm employment information pages don't match, so I went with the ordering of the Confirm page to allow for nice animations between the two modes like requested ("Bonus points if you make the confirm and edit info screens as one screen.").

