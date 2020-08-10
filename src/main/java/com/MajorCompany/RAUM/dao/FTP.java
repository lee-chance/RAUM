package com.MajorCompany.RAUM.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;

public class FTP {
	
	public FTP() {
		// TODO Auto-generated constructor stub
	}

	// 상품이미지등록
	public String getImageName(String pName, String pPrice, File pImageFile) {
		FTPClient ftp = null;
		String result = "";

		try {
			ftp = new FTPClient();
			ftp.setControlEncoding("UTF-8");
			ftp.connect("127.0.0.1", 20); // 접속할 ip
			ftp.login("tj", "1234"); // 접속할 아이디, 비밀번호

			ftp.setFileType(FTPClient.BINARY_FILE_TYPE); // 파일 깨짐 방지

			// ftp 저장할 장소 (루트의 imgs 폴더)
			ftp.changeWorkingDirectory("/");

			File file = pImageFile;

			// 저장할 파일 선택
			File uploadFile = file;
			FileInputStream fis = null;

			try {
				fis = new FileInputStream(uploadFile);

				// ftp 서버에 파일을 저장한다. (저장한 이름, 파일)
				boolean isSuccess = ftp.storeFile(uploadFile.getName(), fis);
				result = uploadFile.getName();
				if (isSuccess) {
					System.out.println("Upload Success");
				}
			} catch (IOException ex) {
				System.out.println("ERR : " + ex.getMessage());
			} finally {
				if (fis != null)
					try {
						fis.close();
					} catch (IOException ex) {
						System.out.println("ERR2 : " + ex.getMessage());
					}
			}
			ftp.logout();

		} catch (SocketException e) {
			System.out.println("Socket:" + e.getMessage());
		} catch (IOException e) {
			System.out.println("IO:" + e.getMessage());
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					System.out.println("ERR3 : " + e.getMessage());
				}
			}
		}

		return result;
	}


}
