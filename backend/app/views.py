from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework import permissions
from rest_framework.response import Response


@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def home(request):
    return Response(status=status.HTTP_200_OK)
