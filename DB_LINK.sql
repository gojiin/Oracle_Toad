--DB��ũ ���� 
CREATE DATABASE LINK JI5_LINK --��ũ�� �� ����� ����
CONNECT TO KOPO2019 --���� ���������� �ϴ� ���̺��� �ִ� ������ ID
IDENTIFIED BY kopo2019 --PW
USING 'DEV_KOPO'; --�������� �ϴ� ���̺��� �����ϴ� ������

CREATE TABLE KOPO_PRODUCT_VOLUME_ji10
AS SELECT * FROM KOPO_PRODUCT_VOLUME@JI5_LINK;

select * from KOPO_PRODUCT_VOLUME_ji10



