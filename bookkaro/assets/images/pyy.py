from bs4 import BeautifulSoup
import requests


image_links = [
  'https://plus.unsplash.com/premium_photo-1661916408325-5280388bf1e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1557223562-6c77ef16210f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1632276536839-84cad7fd03b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1570125909517-53cb21c89ff2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  'https://images.unsplash.com/photo-1570125909232-eb263c188f7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
  'https://images.unsplash.com/photo-1594825223369-381029794758?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80'
]

def download_image(url, file_name, headers):
    # Send GET request
    response = requests.get(url, headers=headers)
    # Save the image
    if response.status_code == 200:
        with open(file_name, "wb") as f:
            f.write(response.content)
    else:
        print(response.status_code)

def extract_image_links(webpage, headers):
    # Send GET request
    response = requests.get(webpage, headers=headers)
    
    # Check if the status_code is 200
    if response.status_code == 200:
        
        # Parse the HTML content of the webpage
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find all of the image tags:
        images = soup.findAll('img')
        
        # Extract 'src' attribute of every image
        image_links = []
        for image in images:
            image_links.append(image.attrs['src'])
        
        #Filter for PNG format image links
        image_links = [image for image in image_links if image.endswith('.png')]
        return image_links

if __name__ == "__main__":
    # Define HTTP Headers
    headers = {
        "User-Agent": "Chrome/51.0.2704.103",
    }
    # Define URL of the webpage
    webpage = 'https://pyshark.com/extract-text-from-image-using-python/'
    #Extract image links
    # image_links = extract_image_links(webpage, headers)

for i, url in enumerate(image_links):
    file_name = f'image{i}.png'
    download_image(url, file_name, headers)
