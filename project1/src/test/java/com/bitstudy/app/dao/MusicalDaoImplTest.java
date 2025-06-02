package com.bitstudy.app.dao;

import com.bitstudy.app.domain.MusicalDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MusicalDaoImplTest {
    @Autowired
    MusicalDao musicalDao;

    @Test
    public void count() {
        deleteAll();

        assertTrue(musicalDao.count() == 0);
    }

    @Test
    public void insert() {
        deleteAll();

        MusicalDto musicalDto = new MusicalDto("a123", "영화제목", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");

        assertTrue(musicalDao.insert(musicalDto) == 1);

    }

    @Test
    public void deleteAll() {
        assertTrue(musicalDao.deleteAll() == 0);
    }

    @Test
    public void delete() {
        deleteAll();

        MusicalDto musicalDto = new MusicalDto("a123", "영화제목", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto2 = new MusicalDto("a124", "영화제목", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto3 = new MusicalDto("a125", "영화제목", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        musicalDao.insert(musicalDto);
        musicalDao.insert(musicalDto2);
        musicalDao.insert(musicalDto3);

        assertTrue(musicalDao.delete("a123") == 1);
    }

//    private void selectAll(){
//
//    }

    @Test
    public void selectAll_title() {
        deleteAll();

        MusicalDto musicalDto1 = new MusicalDto("a1", "가나다", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto2 = new MusicalDto("a2", "나다라", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto3 = new MusicalDto("a3", "다라가", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto4 = new MusicalDto("a4", "다가라", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        musicalDao.insert(musicalDto1);
        musicalDao.insert(musicalDto2);
        musicalDao.insert(musicalDto3);
        musicalDao.insert(musicalDto4);

        assertTrue(musicalDao.selectAll_title().size() == 4);
    }

    @Test
    public void selectAll_title_desc() {
    }

    @Test
    public void select() {
        deleteAll();

        MusicalDto musicalDto1 = new MusicalDto("a1", "가나다", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto2 = new MusicalDto("a2", "나다라", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto3 = new MusicalDto("a3", "다라가", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        MusicalDto musicalDto4 = new MusicalDto("a4", "다가라", "2025-05-20", "20250521", "고척돔", "poster", "스릴러");
        musicalDao.insert(musicalDto1);
        musicalDao.insert(musicalDto2);
        musicalDao.insert(musicalDto3);
        musicalDao.insert(musicalDto4);

        String mu_id = musicalDto1.getMu_id();
        MusicalDto musicalDto = musicalDao.select(mu_id);

        assertTrue(musicalDto1.getMu_id().equals(musicalDto.getMu_id()));
    }

    @Test
    public void rand_venue(){
        System.out.println(musicalDao.rand_venue());
        assertTrue(musicalDao.rand_venue().size() == 3);
    }
}