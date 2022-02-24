#define GLFW_STATIC
#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <shader.h>
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>

using namespace std;

Shader::Shader(const char *vertexPath, const char *fragmentPath)
{
    ifstream vertexFile;
    ifstream fragmentFile;
    stringstream vertexSStream;
    stringstream fragmentSStream;

    vertexFile.open(vertexPath);
    fragmentFile.open(fragmentPath);

    vertexFile.exceptions(ifstream::failbit | ifstream::badbit);
    fragmentFile.exceptions(ifstream::failbit | ifstream::badbit);

    try
    {
        if (!vertexFile.is_open() | !fragmentFile.is_open())
        {
            throw logic_error("open file error");
        }
        vertexSStream << vertexFile.rdbuf();
        fragmentSStream << fragmentFile.rdbuf();

        vertexString = vertexSStream.str();
        fragmentString = fragmentSStream.str();

        vertexSource = vertexString.c_str();
        fragmentSource = fragmentString.c_str();

        unsigned int vertex, fragment;

        vertex = glCreateShader(GL_VERTEX_SHADER);
        glShaderSource(vertex, 1, &vertexSource, NULL);
        glCompileShader(vertex);
        checkCompileErrors(vertex, "FRAGMENT");

        fragment = glCreateShader(GL_FRAGMENT_SHADER);
        glShaderSource(fragment, 1, &fragmentSource, NULL);
        glCompileShader(fragment);
        checkCompileErrors(fragment, "FRAGMENT");

        ID = glCreateProgram();
        glAttachShader(ID, vertex);
        glAttachShader(ID, fragment);
        glLinkProgram(ID);
        checkCompileErrors(ID, "PROGRAM");

        glDeleteShader(vertex);
        glDeleteShader(fragment);
    }
    catch (const std::exception &e)
    {
        std::cerr << e.what() << '\n';
    }
}
// Shader::~Shader()
// {
// }
void Shader::use()
{
    glUseProgram(ID);
}
void Shader::checkCompileErrors(unsigned int ID, std::string type)
{
    int success;
    char infoLog[512];

    if (type != "PROGRAM")
    {
        glGetShaderiv(ID, GL_COMPILE_STATUS, &success);
        if (!success)
        {
            glGetShaderInfoLog(ID, 512, NULL, infoLog);
            cout << "shader compile error:" << infoLog << endl;
        }
    }
    else
    {
        glGetProgramiv(ID, GL_LINK_STATUS, &success);
        if (!success)
        {
            glGetProgramInfoLog(ID, 512, NULL, infoLog);
            cout << "program linking error:" << infoLog << endl;
        }
    }
}