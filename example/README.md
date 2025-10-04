# example

# My Profile Avatar Example

This example app demonstrates all the features and capabilities of the My Profile Avatar package.

## Features Demonstrated

### Avatar Types

- **Network Images**: Loading avatars from URLs with caching and loading states
- **Name Initials**: Generating text-based avatars from user names
- **Placeholder Icons**: Default fallback icons when no content is available
- **Square vs Circular**: Different border radius configurations

### Interactive Controls

- **Size Slider**: Adjust avatar size from 40px to 120px
- **Border Radius Slider**: Control corner rounding from square (0) to perfect circle
- **Color Picker**: Choose from 8 different colors for avatar styling
- **Live Preview**: See changes in real-time across all avatar types

### Different Sizes

- Showcase of avatars in various sizes (40px, 60px, 80px, 100px, 120px)
- Demonstrates how the package scales gracefully across different dimensions

### Factory Constructor Examples

- Examples using `MyProfileAvatar.type()` for explicit type specification
- Shows the alternative way to create avatars when you know the specific type

## Running the Example

1. Navigate to the example directory:

   ```bash
   cd example
   ```

2. Get dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Code Structure

The example app is built with:

- **Material 3 Design**: Modern UI with proper theming
- **Responsive Layout**: Works well on different screen sizes
- **Interactive Controls**: Sliders and color pickers for customization
- **Organized Sections**: Clear separation of different feature demonstrations

## Key Learning Points

1. **Priority System**: Understand how the package automatically selects the best available avatar source
2. **Styling Options**: Learn about all the customization possibilities
3. **Error Handling**: See how the package gracefully handles network failures and missing images
4. **Performance**: Experience smooth loading and caching of network images

This example serves as both a demonstration and a testing ground for the My Profile Avatar package functionality.
