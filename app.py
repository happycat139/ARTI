from fastapi import FastAPI, Request
import torch
import requests
from io import BytesIO
from PIL import Image

app = FastAPI()

# YOLOv5 모델 로드
model = torch.hub.load('ultralytics/yolov5', 'custom', path='C:\\Users\\smhrd1\\Desktop\\AI\\yolov5\\bestHouse.pt')

@app.post("/analyze")
async def analyze_image(request: Request):
    data = await request.json()
    image_url = data['image_url']

    # 이미지 URL에서 파일 다운로드
    response = requests.get(image_url)
    image = Image.open(BytesIO(response.content))

    # YOLOv5 분석 실행
    results = model(image)
    analysis_result = results.pandas().xyxy[0].to_dict(orient='records')

    return {"analysis_result": analysis_result}
