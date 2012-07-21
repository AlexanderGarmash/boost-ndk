#include <iostream>
#include <boost/date_time/gregorian/gregorian.hpp>
#include <boost/static_assert.hpp>
using namespace std;
using namespace boost::gregorian;
 
void test1(){
	date d1;
    date d2(2012,12,12);
    date d3(2012, Jan, 1);
    date d4(d2);
 
    assert(d1==date(not_a_date_time));
    assert(d2==d4);
 
    d1=from_string("2012-12-10");
    d2=(from_string("2012/12/10"));
    d3=from_undelimited_string("20121210");
    cout<<d1<<endl<<d2<<endl<<d3<<endl<<d4<<endl;
 
    cout<<day_clock::local_day()<<endl;
    cout<<day_clock::universal_day()<<endl;
}

void test2(){
    date d(2012,3,26);
    assert(d.year()==2012);
    assert(d.month()==3);
    assert(d.day()==26);
 
    //一次性的获得年月日数据
    date::ymd_type ymd=d.year_month_day();
    assert(ymd.year==2012);
    assert(ymd.month==3);
    assert(ymd.day==26);
     
    cout<<"today is day of week: "<<d.day_of_week()<<endl;  //输出date的星期数，0表示星期日
    cout<<"today is day of this year: "<<d.day_of_year()<<endl;
    cout<<"this week is week of this year: "<<d.week_number()<<endl;
    cout<<"the last day of this month is: "<<d.end_of_month()<<endl;
 
    //几种输出格式的比较
    cout<<to_simple_string(d)<<endl;
    cout<<to_iso_string(d)<<endl;
    cout<<to_iso_extended_string(d)<<endl;
    cout<<d<<endl;
}

void test3(){
    days d1(100);
    days d2(-100);
 
    assert(d1+d2==days(0));
    assert((d1+d2).days()==0);
 
    weeks w(3);    //三个星期
    assert(w.days()==21);
 
    months m(5);  //5个月
    years y(2);  //2年
 
    months m2=y+m;   //2年零5个月
    assert(m2.number_of_months()==29);
    assert(y.number_of_years()*2==4);
}

void test4(){
    date d1(2012,7,21);
    date d2(1989,6,5);
    cout<<"I am "<<d1-d2<<" day old."<<endl;
 
    d1+=days(10); 
    cout<<to_iso_extended_string(d1)<<endl;
 
    d1+=months(2);
    cout<<to_iso_extended_string(d1)<<endl;
 
    d1+=weeks(1);
    cout<<to_iso_extended_string(d1)<<endl;
 
    d1-=years(2);
    cout<<to_iso_extended_string(d1)<<endl;
}

void test5(){
	date_period dp(date(2012,1,1),days(10));
    dp.shift(days(3));
    assert(dp.begin().day()==4);
    assert(dp.length().days()==10);
 
    dp.expand(days(3));
    assert(dp.begin().day()==1);
    assert(dp.length().days()==16);
 
    assert(dp.is_after(date(2000,12,12)));
    assert(dp.is_before(date(2013,12,12)));
    assert(dp.contains(date(2012,1,2)));
}


int main(int argc, char* argv[])
{   
	test1();
	test2();
	test3();
	test4();
    return 0;
}



