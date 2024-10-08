# MainScreen Widget

The `MainScreen` widget is a reusable Flutter component designed to manage different UI states, such as loading, empty content, and displaying data. It includes pull-to-refresh functionality, making it easy to refresh the content from a data source.

<p>
    <a href="https://github.com/abdelrahmanghanem/main_widgets"><img src="https://img.shields.io/github/stars/abdelrahmanghanem/main_widgets?style=social" alt="Repo stars"></a>
    <a href="https://github.com/abdelrahmanghanem/main_widgets/commits/main"><img src="https://img.shields.io/github/last-commit/abdelrahmanghanem/main_widgets/main?logo=git" alt="Last Commit"></a>
    <a href="https://github.com/abdelrahmanghanem/main_widgets/pulls"><img src="https://img.shields.io/github/issues-pr/abdelrahmanghanem/main_widgets" alt="Repo PRs"></a>
    <a href="https://github.com/abdelrahmanghanem/main_widgets/issues?q=is%3Aissue+is%3Aopen"><img src="https://img.shields.io/github/issues/abdelrahmanghanem/main_widgets" alt="Repo issues"></a>
    <a href="https://github.com/abdelrahmanghanem/main_widgets/blob/main/LICENSE"><img src="https://badgen.net/github/license/abdelrahmanghanem/main_widgets" alt="License"></a>
</p>

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Parameters](#parameters)
- [Contributions](#contributions)
- [License](#license)

## Features

- Displays loading indicator when data is being fetched.
- Shows a custom or default empty screen when there is no data.
- Wraps the main content in a pull-to-refresh functionality.

## Installation

To use the `MainScreen` widget in your Flutter project, follow these steps:
1. Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  main_widgets: <latest_version>
```

## Usage

You can use the `MainScreen` widget as follows:

```dart
    MainScreen(
      isLoading: true, // Set to true while data is being loaded
      isEmpty: false, // Set to true if there is no data to display
      child: YourMainContentWidget(), // The main content to display
      onRefresh: () async {
        // Add your refresh logic here
      },
    );
```
## Parameters

- **`isLoading`** (`bool`):
    - **Description**: Indicates whether the data is currently being loaded.
    - **Usage**: Set this parameter to `true` when you are fetching data to show a loading indicator.

- **`isEmpty`** (`bool`):
    - **Description**: Indicates whether the data is empty.
    - **Usage**: Set this parameter to `true` if there is no data available to display.

- **`child`** (`Widget`):
    - **Description**: The main content to display when data is available.
    - **Usage**: Pass your main content widget (e.g., a `ListView`, `GridView`, etc.) to this parameter.

- **`onRefresh`** (`Future<void> Function()`):
    - **Description**: Callback function that is triggered when the user performs a pull-to-refresh action.
    - **Usage**: Implement this function to handle the refresh logic, such as re-fetching data.

- **`emptyWidget`** (`Widget?`):
    - **Description**: A custom widget to display when the data is empty (optional).
    - **Usage**: If you want to display a specific widget when there's no data, provide it here. If not provided, a default empty state will be shown.

- **`message`** (`String?`):
    - **Description**: An optional message to display in the empty state widget.
    - **Usage**: Use this parameter to provide additional context or instructions when there is no data available.

## Example Usage

Here is an example demonstrating how to use these parameters in the `MainScreen` widget:

```dart
    MainScreen(
      isLoading: true, // Data is being loaded
      isEmpty: false, // Data is available
      child: YourMainContentWidget(), // Main content to display
      onRefresh: () async {
        // Logic for refreshing data
      },
      emptyWidget: CustomEmptyWidget(message: "No data available"), // Optional empty widget
      message: "Please check back later.", // Optional message for empty state
    );
```
## Contributions
Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/abdelrahmanghanem/main_widgets/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/abdelrahmanghanem/main_widgets/pulls).

<a href="https://github.com/abdelrahmanghanem/main_widgets/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=abdelrahmanghanem/main_widgets"  alt=""/>
</a>

Made with [contrib.rocks](https://contrib.rocks).