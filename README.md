<div align="center">
  <br/><br/>
  <!-- <img src="./path/to/icon.png" width="215" /> -->
  <br/><br/>

  # Linky

![GitHub release](https://img.shields.io/github/v/release/GnuCodingStudio/Linky-KenneyJam-2024?include_prereleases)
![GitHub](https://img.shields.io/github/license/GnuCodingStudio/Linky-KenneyJam-2024)

  Inspired by KennyJam 2024, Linky is a two player shared-screen game.
  The players are linked by Linky, a laser beam which must not be broken or interrupt.

  <br/>
  <!-- <img src="./path/to/game.gif" width="600" /> -->

  [![Available on itch.io](/assets/image/promo/itchio.png)](https://gnucodingstudio.itch.io/linky-kenneyjam-2024)
</div>


## Feature

- ✨ Two players - Shared screen
- 📝 Multiple rooms to resolve!
- 🎁 Infinite run


## Roadmap

- No more roadmap


## Contribute

If you want to create your own rooms, you can fork the project.
Look at how other rooms are created: `/scenes/levels/door/...` for instance.
Once created, you may add it to `InfiniteLoader` class.

Basically, a room should:
- extend `BasicLevel`
- start at [0; 0] and face the top
- have a Node2D defining the position to place the next level
- have 6 blocks wide start and end
- be finishable


## Tech & Tools

- Godot 4.3
- Kenney assets


## Play & Download

- [Github releases](https://github.com/GnuCodingStudio/Linky-KenneyJam-2024/releases)
- [Itch.io](https://gnucodingstudio.itch.io/linky-kenneyjam-2024)
