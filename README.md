# TestChat

Проект чата для тестового задания

Тестирование API:
1. API-метод для получения всех созданных чатов - черз путь "/api/v1/chats"
2. API-метод для создания сообщений в чате - черз путь "api/v1/messages",
тело:
```
{
    "message": {
        "content": "Привет, это анонимное сообщение!",
        "chat_title": "Название чата"
   }
}
```
