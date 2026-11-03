# recyclemap

**Flutter prototype for mapping community waste reports.**

`recyclemap` explores a practical way to make litter visible: associate a waste observation with a place, then use that geographic context to understand where cleanup work may be needed. It belongs to a group of waste-reporting experiments alongside `TrashApp`, `TrashAppServer`, and `TrashModelTraining`.

> **Status:** Prototype. The repository's earlier public description and Flutter project structure were inspected, but individual Dart screens were not available for verification. The items under *Project direction* are goals, not a claim that all features are working.

## Project direction

- Capture or submit an observation about waste or litter.
- Associate an observation with geographic context.
- Display observations on a map or geographic view.
- Help communities make more informed cleanup decisions.

## Technology and structure

| Area | Evidence from the repository |
| --- | --- |
| Application | Dart / Flutter |
| Mobile targets | Android, iOS project directories |
| Visual resources | `assets/`, `fonts/` |
| Flutter configuration | `pubspec.yaml` |
| Static analysis | `analysis_options.yaml` |

```text
recyclemap/
├── lib/                   # Dart source code
├── android/               # Android runner and configuration
├── ios/                   # iOS runner and configuration
├── assets/                # Image and other UI resources
├── fonts/                 # Custom font assets
├── pubspec.yaml           # Packages, assets and SDK constraints
├── analysis_options.yaml  # Lint rules
└── README.md
```

## Run locally

Install the [Flutter SDK](https://docs.flutter.dev/get-started/install) and configure an emulator or physical device.

```bash
git clone https://github.com/dandanman4k/recyclemap.git
cd recyclemap
flutter doctor
flutter pub get
flutter devices
flutter run
```

For a release Android build, when platform configuration is complete:

```bash
flutter build apk --release
```

Check `pubspec.yaml` for the supported SDK versions. Mapping and location permissions, if used by the application, must be configured according to the code and the target platform.

## Development checks

```bash
flutter analyze
flutter test
```

`flutter test` requires maintained tests in the checkout; failures do not necessarily indicate an install problem.

## Data and privacy

Waste observations may include photographs and geographic coordinates. If these are collected, request permission, minimize unnecessary personal information, and avoid exposing identifiable people or private property locations. Never commit API keys or collected personal data.

## Related repositories

- [TrashApp](https://github.com/dandanman4k/TrashApp): another Flutter waste-reporting client.
- [TrashAppServer](https://github.com/dandanman4k/TrashAppServer): related Node.js backend.
- [TrashModelTraining](https://github.com/dandanman4k/TrashModelTraining): model-training experiment for waste imagery.

## Roadmap for documentation

Confirm which map screens and location-report flows are implemented; add screenshots, required permissions, configuration instructions, and known limitations after testing a fresh install.

## License

Refer to a `LICENSE` file in the current repository, if present. A public repository without an explicit license is not automatically open-source licensed.
