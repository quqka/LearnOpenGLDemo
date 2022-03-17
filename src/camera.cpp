#include "camera.h"

Camera::Camera(glm::vec3 position, glm::vec3 target, glm::vec3 worldup)
{
    Position = position;
    WorldUp = worldup;
    Forward = glm::normalize(target - position);
    Right = glm::normalize(glm::cross(Forward, WorldUp));
    Up = glm::normalize(glm::cross(Forward, Right));
}
Camera::Camera(glm::vec3 position, float pitch, float yaw, glm::vec3 worldup)
{
    Position = position;
    WorldUp = worldup;
    pitch = Pitch;
    yaw = Yaw;
    Forward.x = glm::cos(Pitch) * glm::cos(Yaw);
    Forward.y = glm::sin(Pitch);
    Forward.z = glm::sin(Pitch) * glm::cos(Yaw);
    Right = glm::normalize(glm::cross(Forward, WorldUp));
    Up = glm::normalize(glm::cross(Forward, Right));
}
glm::mat4 Camera::GetViewMatrix()
{
    return glm::lookAt(Position, Position + Forward, WorldUp);
}
void Camera::UpdateCameraVectors()
{
    Forward.x = glm::cos(Pitch) * glm::cos(Yaw);
    Forward.y = glm::sin(Pitch);
    Forward.z = glm::sin(Pitch) * glm::cos(Yaw);
    Right = glm::normalize(glm::cross(Forward, WorldUp));
    Up = glm::normalize(glm::cross(Forward, Right));
}
void Camera::ProcessMouseMovement(float deltax, float deltay)
{
    Pitch -= deltax * Sensex;
    Yaw -= deltay * Sensey;
    UpdateCameraVectors();
}
void Camera::UpdateCameraPos()
{
    Position += Forward * speedZ * 0.1f;
}
Camera::~Camera()
{
}