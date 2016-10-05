/*
 * Copyright 2015 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *  
 * Create Date : 2015-1-12
 */

package com.jeedcp.test.spring;

import org.springframework.test.context.ContextConfiguration;

/**
 * 基于JUnit4并依赖于Spring上下文资源的单元测试类
 */
@ContextConfiguration(locations = { "/applicationContext.xml" })
public abstract class JUnit4SpringContextTestCase extends JUnit4SpringTestCase {
 
}