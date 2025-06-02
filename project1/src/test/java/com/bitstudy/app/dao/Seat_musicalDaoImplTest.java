package com.bitstudy.app.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class Seat_musicalDaoImplTest {

    @Autowired
    Seat_musicalDao seat_musicalDao;

    @Test
    public void select_s_id() {
        String mu_id = "PF249156";
        String s_label = "A05";
        assertTrue(seat_musicalDao.select_s_id(mu_id, s_label) == 77);
    }

    @Test
    public void update_true() {
        Integer s_id = 6;
        assertTrue(seat_musicalDao.update_false(s_id) == 1);
    }

    @Test
    public void update_false() {
        Integer s_id = 6;
        assertTrue(seat_musicalDao.update_true(s_id) == 1);
    }

    @Test
    public void select_false() {
        System.out.println(seat_musicalDao.select_false());

        assertTrue(seat_musicalDao.select_false().size() == 2);
    }
}