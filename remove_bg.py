from rembg import remove
from PIL import Image

def process_img(input_path, output_path):
    print(f"Processing {input_path}...")
    try:
        input_img = Image.open(input_path)
        output_img = remove(input_img)
        output_img.save(output_path)
        print(f"Saved to {output_path}")
    except Exception as e:
        print(f"Error: {e}")

process_img("img/chatbuddy_logo.png", "img/chatbuddy_logo.png")
process_img("img/atmos_logo.png", "img/atmos_logo.png")
