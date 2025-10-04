import 'package:flutter/material.dart';
import 'package:my_profile_avatar/my_profile_avatar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile Avatar Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AvatarExamplePage(),
    );
  }
}

class AvatarExamplePage extends StatefulWidget {
  const AvatarExamplePage({super.key});

  @override
  State<AvatarExamplePage> createState() => _AvatarExamplePageState();
}

class _AvatarExamplePageState extends State<AvatarExamplePage> {
  double _avatarSize = 80;
  double _borderRadius = 40;
  Color _selectedColor = Colors.blue;

  final List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile Avatar Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Avatar Types'),
            const SizedBox(height: 16),
            _buildAvatarTypesSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Customization Controls'),
            const SizedBox(height: 16),
            _buildCustomizationControls(),
            const SizedBox(height: 32),
            _buildSectionTitle('Live Preview'),
            const SizedBox(height: 16),
            _buildLivePreview(),
            const SizedBox(height: 32),
            _buildSectionTitle('Different Sizes'),
            const SizedBox(height: 16),
            _buildSizesSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Factory Constructor Examples'),
            const SizedBox(height: 16),
            _buildFactoryExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildAvatarTypesSection() {
    return Column(
      children: [
        _buildAvatarExample(
          'Network Image',
          'Loads from URL with caching',
          MyProfileAvatar(
            style: MyProfileAvatarStyle(
              size: 80,
              color: Colors.blue,
              radius: 40,
            ),
            urlImage:
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
        ),
        const SizedBox(height: 24),
        _buildAvatarExample(
          'Name Initials',
          'Generated from user name',
          MyProfileAvatar(
            style: MyProfileAvatarStyle(
              size: 80,
              color: Colors.green,
              radius: 40,
            ),
            name: 'John Doe',
          ),
        ),
        const SizedBox(height: 24),
        _buildAvatarExample(
          'Placeholder',
          'Default fallback icon',
          MyProfileAvatar(
            style: MyProfileAvatarStyle(
              size: 80,
              color: Colors.grey,
              radius: 40,
            ),
            // No image sources provided
          ),
        ),
        const SizedBox(height: 24),
        _buildAvatarExample(
          'Square Style',
          'Avatar with sharp corners',
          MyProfileAvatar(
            style: MyProfileAvatarStyle(
              size: 80,
              color: Colors.purple,
              radius: 0, // Square
            ),
            name: 'Square',
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarExample(String title, String description, Widget avatar) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          avatar,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomizationControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size: ${_avatarSize.round()}px',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Slider(
            value: _avatarSize,
            min: 40,
            max: 120,
            divisions: 8,
            onChanged: (value) => setState(() => _avatarSize = value),
          ),
          const SizedBox(height: 16),
          Text(
            'Border Radius: ${_borderRadius.round()}px',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Slider(
            value: _borderRadius,
            min: 0,
            max: _avatarSize / 2,
            divisions: (_avatarSize / 4).round(),
            onChanged: (value) => setState(() => _borderRadius = value),
          ),
          const SizedBox(height: 16),
          Text('Color', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _colors.map((color) {
              final isSelected = color == _selectedColor;
              return GestureDetector(
                onTap: () => setState(() => _selectedColor = color),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: Colors.black, width: 3)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLivePreview() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Live Preview',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  MyProfileAvatar(
                    style: MyProfileAvatarStyle(
                      size: _avatarSize,
                      color: _selectedColor,
                      radius: _borderRadius,
                    ),
                    urlImage:
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  ),
                  const SizedBox(height: 8),
                  const Text('Network'),
                ],
              ),
              Column(
                children: [
                  MyProfileAvatar(
                    style: MyProfileAvatarStyle(
                      size: _avatarSize,
                      color: _selectedColor,
                      radius: _borderRadius,
                    ),
                    name: 'John Doe',
                  ),
                  const SizedBox(height: 8),
                  const Text('Name'),
                ],
              ),
              Column(
                children: [
                  MyProfileAvatar(
                    style: MyProfileAvatarStyle(
                      size: _avatarSize,
                      color: _selectedColor,
                      radius: _borderRadius,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Placeholder'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSizesSection() {
    final sizes = [40.0, 60.0, 80.0, 100.0];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Different Avatar Sizes',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: sizes.map((size) {
              return Column(
                children: [
                  MyProfileAvatar(
                    style: MyProfileAvatarStyle(
                      size: size,
                      color: Colors.blue,
                      radius: size / 2,
                    ),
                    name: 'User',
                  ),
                  const SizedBox(height: 8),
                  Text('${size.round()}px'),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFactoryExamples() {
    return Column(
      children: [
        _buildAvatarExample(
          'Factory: Network',
          'Using MyProfileAvatar.type()',
          MyProfileAvatar.type(
            type: MyProfileAvatarType.network,
            value:
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            style: MyProfileAvatarStyle(
              size: 80,
              color: Colors.indigo,
              radius: 40,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildAvatarExample(
          'Factory: Name',
          'Explicit type specification',
          MyProfileAvatar.type(
            type: MyProfileAvatarType.name,
            value: 'Alice Johnson',
            style: MyProfileAvatarStyle(
              size: 80,
              color: Colors.teal,
              radius: 40,
            ),
          ),
        ),
      ],
    );
  }
}
