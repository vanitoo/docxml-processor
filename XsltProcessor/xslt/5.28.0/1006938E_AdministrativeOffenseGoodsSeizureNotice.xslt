<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:aogsn="urn:customs.ru:Information:CustomsAuditDocuments:AdministrativeOffenseGoodsSeizureNotice:5.24.0">
	<!-- Шаблон для типа AdministrativeOffenseGoodsSeizureNoticeType -->
	<xsl:template match="aogsn:AdministrativeOffenseGoodsSeizureNotice">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 180mm;
					max-width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
	
					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align:top;}

					.indent
					{text-indent: 1.5em;}

					.delim_3
					{height: 3pt;}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w180">
						<tbody>
							<tr>
								<td>
									<table class="w180">
										<tbody>
											<tr>
												<td width="50%"></td>
												<td width="50%" class="value" align="center">
													<xsl:apply-templates select="aogsn:Owner"/>
													<xsl:text>; </xsl:text>
													<xsl:apply-templates select="aogsn:Owner/aogsn:Address"/>
												</td>
											</tr>
											<tr>
												<td width="50%"></td>
												<td width="50%" class="descr">(организационно-правовая форма и наименование юридического лица, юридический и фактический адреса, наименование индивидуального предпринимателя адрес регистрации/фактического пребывания, фамилия, имя, отчество физического лица, адрес регистрации/фактического проживания)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>Уведомление</b>
									<br/><b>о совершении таможенных операций в отношении изъятых (арестованных)</b>
									<br/><b>по делу об административном правонарушении товаров</b>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<br/>
									<xsl:text>Настоящим информируем о том, что </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aogsn:DocumentDecision/aogsn:Authority"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(наименование органа вынесшего постановление)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>по делу об административном правонарушении (далее - АП) № </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aogsn:OffenceCaseInfo/aogsn:CaseRegNumber"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(номер дела об АП)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'93mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>возбужденного в отношении</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aogsn:Offender"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(субъект правонарушения)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>по</xsl:text>
									<xsl:for-each select="aogsn:OffenceCaseInfo/aogsn:KoAPArticle">
										<xsl:if test="position()!=1">,</xsl:if>
										<xsl:text> ч. </xsl:text>
										<u>
											&#160;&#160;
											<xsl:for-each select="aogsn:NpaArticleParts">
												<xsl:if test="position()!=1">, </xsl:if>
												<xsl:value-of select="aogsn:NpaArticlePart"/>
											</xsl:for-each>
											&#160;&#160;
										</u>
										&#160;<xsl:text>ст. </xsl:text>
										<u>
											&#160;&#160;
											<xsl:value-of select="aogsn:NpaArticle"/>
											&#160;&#160;
										</u>
									</xsl:for-each>
									&#160;<xsl:text>Кодекса Российской Федерации об административных правонарушениях (КоАП РФ) </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="aogsn:DocumentDecision/aogsn:Date"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(дата постановления)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'35mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>вынесено </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aogsn:DocumentDecision/aogsn:TypeName"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(наименование постановления)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100mm'"/>
									</xsl:call-template>
									<xsl:text>.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>В отношении товаров, </xsl:text>
									<table class="inlinetable" style="width: 60mm;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:choose>
														<xsl:when test="contains(aogsn:DocumentSeized[1]/aogsn:TypeName, 'арест')">
															<s><xsl:text>изъятых</xsl:text></s>
															<xsl:text> / арестованных</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>изъятых / </xsl:text>
															<s><xsl:text>арестованных</xsl:text></s>
														</xsl:otherwise>
													</xsl:choose>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													(ненужное зачеркнуть)
												</td>
											</tr>
										</tbody>
									</table>
									&#160;<xsl:text>на основании </xsl:text>
									<xsl:for-each select="aogsn:DocumentSeized">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="aogsn:TypeName"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr">
												<xsl:text>(вид протокола)</xsl:text>
											</xsl:with-param>
											<xsl:with-param name="width" select="'100mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>от </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="aogsn:Date"/>
												</xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr">
												<xsl:text>(дата постановления)</xsl:text>
											</xsl:with-param>
											<xsl:with-param name="width" select="'35mm'"/>
										</xsl:call-template>
										<xsl:text>, </xsl:text>
									</xsl:for-each>
									<xsl:text>помещенных на ответственное хранение </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aogsn:Keeper"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(хранитель)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									&#160;<xsl:text>по адресу </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aogsn:Keeper/aogsn:Address"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(место хранения)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									&#160;<xsl:text>и подлежащих таможенному декларированию принято решение об их возврате законному владельцу.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Указанные товары могут быть получены после вступления постановления (решения) по делу об АП в законную силу и совершения в отношении них таможенных операций.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Товары должны быть помещены на временное хранение не позднее 10 календарных дней со дня, следующего за днем вступления в законную силу постановления (решения) по делу об АП. Товары могут не помещаться на временное хранение, если в отношении них до истечения указанного срока, подана таможенная декларация.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Помещение товаров на временное хранение осуществляется в порядке, предусмотренном статьей 91 Федерального закона от 03.08.2018 № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» (Федеральный закон № 289-ФЗ).</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Товары, не помещенные на временное хранение в установленный срок, задерживаются таможенным органом в соответствии с главой 51 ТК ЕАЭС. Последующие действия с задержанными товарами осуществляются в порядке, предусмотренном главой 55 Федерального закона № 289-ФЗ.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Нарушение установленных требований и условий помещения товаров на склад временного хранения или в иное место временного хранения влечет административную ответственность по статье 16.14 КоАП РФ.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>С момента </xsl:text>
									<table class="inlinetable" style="width: 40mm;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:choose>
														<xsl:when test="contains(aogsn:DocumentSeized[1]/aogsn:TypeName, 'арест')">
															<s><xsl:text>изъятия</xsl:text></s>
															<xsl:text> / ареста</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>изъятия / </xsl:text>
															<s><xsl:text>ареста</xsl:text></s>
														</xsl:otherwise>
													</xsl:choose>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													(ненужное зачеркнуть)
												</td>
											</tr>
										</tbody>
									</table>
									&#160;<xsl:text>товаров расходы по их хранению в качестве вещественных доказательств до вступления постановления (решения) в законную силу возмещаются в порядке, установленном КоАП РФ.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Со дня, следующего за днем вступления постановления (решения) по делу об АП в законную силу, хранитель имеет право требовать от законного владельца (собственника) товаров возмещения расходов, связанных с их хранением. Законный владелец (собственник) товаров несет бремя содержания принадлежащего ему имущества.</xsl:text>
									<br/><br/><br/><br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="36%">
													<xsl:text>Должностное лицо таможенного органа</xsl:text>
												</td>
												<td width="5%"/>
												<td class="value" width="20%"/>
												<td width="5%"/>
												<td class="value" align="center" width="34%">
													<xsl:value-of select="aogsn:CustomsPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="substring(aogsn:CustomsPerson/cat_ru:PersonName,1,1)"/>
													<xsl:text>.</xsl:text>
													<xsl:if test="aogsn:CustomsPerson/cat_ru:PersonMiddleName">
														<xsl:value-of select="substring(aogsn:CustomsPerson/cat_ru:PersonMiddleName,1,1)"/>
														<xsl:text>.</xsl:text>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="descr" valign="top"/>
												<td/>
												<td class="descr" valign="top"><xsl:text>(штамп ЭЦП)</xsl:text></td>
												<td/>
												<td class="descr" valign="top"><xsl:text>(ФИО ДЛ ТО)</xsl:text></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="aogsn:Owner/aogsn:Address | aogsn:Keeper/aogsn:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="aogsn:Offender | aogsn:Owner | aogsn:Keeper">
		<xsl:choose>
			<xsl:when test="aogsn:Type='1'">
				<xsl:text>юридическое лицо: </xsl:text>
				<xsl:value-of select="aogsn:OrganizationName"/>
			</xsl:when>
			<xsl:when test="aogsn:Type='2'">
				<xsl:text>физическое лицо: </xsl:text>
				<xsl:apply-templates select="aogsn:Person"/>
			</xsl:when>
			<xsl:when test="aogsn:Type='3'">
				<xsl:text>индивидуальный предприниматель: </xsl:text>
				<xsl:apply-templates select="aogsn:Person"/>
			</xsl:when>
			<xsl:when test="aogsn:Type='4'">
				<xsl:text>должностное лицо: </xsl:text>
				<xsl:apply-templates select="aogsn:Person"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="aogsn:INN">
			<xsl:text>, ИНН - </xsl:text>
			<xsl:value-of select="aogsn:INN"/>
		</xsl:if>
		<xsl:if test="aogsn:KPP">
			<xsl:text>, КПП - </xsl:text>
			<xsl:value-of select="aogsn:KPP"/>
		</xsl:if>
		<xsl:if test="aogsn:OGRN">
			<xsl:text>, ОГРН - </xsl:text>
			<xsl:value-of select="aogsn:OGRN"/>
		</xsl:if>
		<xsl:if test="aogsn:RN">
			<xsl:text>, регистрационный номер - </xsl:text>
			<xsl:value-of select="aogsn:RN"/>
		</xsl:if>
		<xsl:if test="aogsn:NN">
			<xsl:text>, налоговый номер - </xsl:text>
			<xsl:value-of select="aogsn:NN"/>
		</xsl:if>
		<xsl:if test="aogsn:RegDate">
			<xsl:text>, дата регистрации - </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="aogsn:RegDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="aogsn:RegPlace">
			<xsl:text>, место регистрации - </xsl:text>
			<xsl:value-of select="aogsn:RegPlace"/>
		</xsl:if>
		<xsl:if test="aogsn:CountryCode">
			<xsl:text>, код страны принадлежности - </xsl:text>
			<xsl:value-of select="aogsn:CountryCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value" align="center" style="text-align: center;">
						<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($dateIn,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>