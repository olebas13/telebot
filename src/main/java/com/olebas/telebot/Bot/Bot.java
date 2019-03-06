package com.olebas.telebot.Bot;

import com.olebas.telebot.SB.Author;
import com.olebas.telebot.SB.Book;
import com.olebas.telebot.helper.ReadFileData;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.methods.send.SendPhoto;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class Bot extends TelegramLongPollingBot {

    private long chat_id;
    private static ReadFileData data = new ReadFileData();

    public void onUpdateReceived(Update update) {
        update.getUpdateId();
        SendMessage sendMessage = new SendMessage().setChatId(update.getMessage().getChatId());
        chat_id = update.getMessage().getChatId();
        sendMessage.setText(input(update.getMessage().getText()));

        try {
            execute(sendMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    public String input(String msg) {
        if (msg.contains("Hi") || msg.contains("Hello") || msg.contains("Привет")) {
            return "Привет, братан!";
        }
        if (msg.contains("Информация о книге")) {
            return getInfoBook();
        }
        if (msg.contains("/person")) {
            msg = msg.replace("/person ", "");
            return getInfoPerson(msg);
        }
        return "He понял!";
    }

    public String getInfoBook(){
        Book book = new Book();
        SendPhoto sendPhotoRequest = new SendPhoto();

        try(InputStream in = new URL(book.getImg()).openStream()){
            sendPhotoRequest.setChatId(chat_id);
            sendPhotoRequest.setPhoto("Photo", in);
            execute(sendPhotoRequest);
        } catch (IOException ex){
            System.out.println("File not found");
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }

        String info = book.getTitle()
                + "\nАвтор: " + book.getAutorName()
                + "\nЖанр: " + book.getGeners()
                + "\n\nОписание:\n" + book.getDescription()
                + "\n\nКоличество лайков: " + book.getLikes()
                + "\n\nПоследние коментарии:\n" + book.getCommentList();
        return info;
    }

    public String getInfoPerson(String msg) {
        Author author = new Author(msg);

        SendPhoto sendPhotoRequest = new SendPhoto();

        try(InputStream in = new URL(author.getAvatar()).openStream()){
            sendPhotoRequest.setChatId(chat_id);
            sendPhotoRequest.setPhoto("Photo", in);
            execute(sendPhotoRequest);
        } catch (IOException ex){
            System.out.println("File not found");
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }

        return author.getInfoPerson();
    }

    @Override
    public String getBotToken() {
        String token = data.getBotToken();
        return token;
    }

    public String getBotUsername() {
        String username = data.getBotUsername();
        return username;
    }
}
