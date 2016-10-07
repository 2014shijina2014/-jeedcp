package com.jeedcp.api;


import com.jeedcp.api.client.OpenClient;

public class TestBase {
	static String appId = "test";
	static String secret = "123456";

	static OpenClient client = new OpenClient(appId, secret);

	public static OpenClient getClient() {
		return client;
	}

	public static void setClient(OpenClient client) {
		TestBase.client = client;
	}

}
