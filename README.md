# Consequence

> An [Influence](https://itunes.apple.com/au/app/influence-the-puzzle-game/id1147836961?mt=8) brute force solver

## About

Influence is a very well executed peg based puzzle game made by [Andy Drizen](https://twitter.com/andydrizen)

It also captured my curiosity by being just hard enough that I wondered if I could just make something to solve the puzzles for me automatically.

Turns out it is possible. But brute forcing levels with a lot of moves does take an inordinate amount of time.

## Quick start

(Note, the UI is a MASSIVE work in progress)

- Checkout the project
- Open it with Xcode
- Select the Consequence-macOS target
- Run
- Select a board and the depth of moves to allow
- Click Brute force search
- Profit

Only a 4 random boards from influence have been encoded, and there is no automated board interpreter yet. I don't think it's fair to Andy to include all boards without permission. Boards are located in `Influence/Boards.swift` and the list of boards available in the UI are in `Consequence/ProcessViewController.swift:boards`.

The Whale board has not finished computing on my machine yet. It's up to 0.2%. I would appreciate input on optimising the brute force algorithms.

## License

This project is released under the [Apache 2.0](LICENSE.md) license.
