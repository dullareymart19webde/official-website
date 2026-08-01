from PIL import Image

def remove_background_color(input_path, output_path, tolerance=50):
    try:
        img = Image.open(input_path).convert("RGBA")
        data = img.getdata()
        
        # Assume top-left pixel is the background color
        bg_color = data[0]
        
        new_data = []
        for item in data:
            # Check if pixel is close to background color
            if (abs(item[0] - bg_color[0]) <= tolerance and
                abs(item[1] - bg_color[1]) <= tolerance and
                abs(item[2] - bg_color[2]) <= tolerance):
                # Replace with transparent pixel
                new_data.append((255, 255, 255, 0))
            else:
                new_data.append(item)
                
        img.putdata(new_data)
        img.save(output_path, "PNG")
        print(f"Processed {input_path}")
    except Exception as e:
        print(f"Error processing {input_path}: {e}")

remove_background_color("img/chatbuddy_logo.png", "img/chatbuddy_logo.png")
remove_background_color("img/atmos_logo.png", "img/atmos_logo.png")
