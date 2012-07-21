
#include<iostream>
#include<fstream>
#include<boost/filesystem.hpp>

int main()
{
        namespace bf=boost::filesystem;//�򵥱���

        bf::path path("/sdcard/tmp/test");

        bf::path old_cpath=bf::current_path();

        bf::path file_path = path / "file";

        if(bf::exists(path))
        {
                std::ofstream out(path.string().c_str());
                if(!out) return 1;
                out << "һ�������ļ�\n";
        } else {
                std::cout << path << "������\n";

                bf::create_directory(path);
                std::ofstream out(file_path.string().c_str());
                if(!out) return 1;
                out << "һ�������ļ�\n";
        }

        bf::current_path(path);

        if(bf::is_regular_file(path))
        {
                std::cout << path << "����ͨ�ļ�\n";
                std::cout << path << ": ��СΪ" << bf::file_size(path) <<'\n';
                bf::create_symlink(file_path, "/sdcard/tmp/test/file-symlink");
        } 

        bf::current_path(old_cpath);

        bf::remove(file_path);
        bf::remove_all(path);

        return 0;
}
