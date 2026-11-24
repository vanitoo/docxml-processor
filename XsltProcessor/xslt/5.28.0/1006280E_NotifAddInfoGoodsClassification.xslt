<?xml version="1.0" encoding="utf-8"?>
<!-- 
DocType=1 - Приложение № 7 к Приказу ФТС России от 06.02.2019 № 194 - Уведомление о необходимости представления дополнительной информации (Решение о классификации товара, перемещаемого в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде)
DocType=2 - Приложение № 3 к Приказу ФТС России от 05.02.2019 № 205 - Уведомление о необходимости предоставления дополнительной информации (Предварительное решение о о классификации товара в соответствии с ТН ВЭД ЕАЭС) 
DocType=3 - Приложение № 3 к Приказу ФТС России от 05.02.2019 № 181 - Уведомление о необходимости предоставления дополнительной информации (Предварительное решение о происхождении товара)
DocType=4 - формы нет - Уведомление о подаче последней ДТ-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:naigc="urn:customs.ru:Information:CustomsDocuments:NotifAddInfoGoodsClassification:5.24.0">
	<!-- Шаблон для типа NotifAddInfoGoodsClassificationType -->
	<xsl:template match="naigc:NotifAddInfoGoodsClassification">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  
                  .inlinetable
					{
					border: 0;
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
					align: justify;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}					
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:if test="naigc:DocType=1">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Уведомление о необходимости представления дополнительной информации</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="bottom">
									<td width="45%">
										<span style="width:40%; display: inline-block; text-align:center;" class="value">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="naigc:NotifDate"/>
											</xsl:call-template>
										</span>
										<xsl:text> №</xsl:text>
										<span style="width:40%; display: inline-block; text-align:center;" class="value">
											<xsl:value-of select="naigc:NotifNumber"/>
										</span>
										<br/>
										<br/>
										<xsl:text>На №</xsl:text>
										<span style="width:40%; display: inline-block; text-align:center;" class="value">
											<xsl:value-of select="naigc:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
										</span>
										<xsl:text> от </xsl:text>
										<span style="width:35%; display: inline-block; text-align:center;" class="value">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="naigc:ApplicationRegistration/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</span>
										<br/>
										<br/>
										<xsl:text>О представлении дополнительной информации</xsl:text>
									</td>
									<td width="10%"/>
									<td width="45%">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="naigc:Declarant/naigc:Chief/cat_ru:PersonPost"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'должность руководителя (заместителя руководителя) организации'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="naigc:Declarant/cat_ru:OrganizationName"/>
												<xsl:if test="not(naigc:Declarant/cat_ru:OrganizationName) and naigc:Declarant/cat_ru:ShortName">
													<xsl:value-of select="naigc:Declarant/cat_ru:ShortName"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'наименование организации'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="naigc:Declarant/naigc:Chief">
													<xsl:value-of select="cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonMiddleName"/>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'фамилия и инициалы руководителя (заместителя руководителя) организации или физического лица, подавшего заявление'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="naigc:Declarant/cat_ru:Address" mode="comma"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'почтовый адрес организации или физического лица, подавшего заявление'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="naigc:Declarant/cat_ru:Contact/cat_ru:E_mail">
													<xsl:if test="position() &gt; 1">; </xsl:if>
													<xsl:value-of select="."/>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'адрес электронной почты'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<!--<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="spaced" select="naigc:Customs"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'наименование таможенного органа, структурного подразделения таможенного органа'"/>
											<xsl:with-param name="width" select="'99%'"/>
										</xsl:call-template>
										<xsl:text>, </xsl:text>
										<br/>
										<xsl:text>рассмотрев обращение</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="naigc:Declarant/cat_ru:OrganizationName"/>
												<xsl:if test="not(naigc:Declarant/cat_ru:OrganizationName) and naigc:Declarant/cat_ru:ShortName">
													<xsl:value-of select="naigc:Declarant/cat_ru:ShortName"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование организации или фамилия и инициалы физического лица)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>по вопросу классификации товара "</xsl:text>
										<xsl:apply-templates select="naigc:GoodsDescription"/>
										<xsl:text>" в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности ЕАЭС, сообщает следующее.</xsl:text>
										<br/>
										<br/>
										<xsl:text>В соответствии с частью 12 статьи 16 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" (далее - Федеральный закон) уведомляем, что для принятия решения о классификации товара в ФТС России необходимо представить следующую дополнительную информацию в соответствии с порядком, определенным данной статьей:</xsl:text>-->
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-indent: 5%; text-align:justify; font-size: 14pt" class="value">
										<xsl:for-each select="naigc:RequestedInfo">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr">
										<xsl:text>запрашиваемые сведения</xsl:text>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-indent: 5%; text-align:justify">Информируем, что в соответствии с частью 13 статьи 16 Федерального закона вышеуказанная дополнительная информация представляется в течение 60 (шестидесяти) календарных дней со дня уведомления заявителя.</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
										<xsl:apply-templates select="naigc:CustomsPerson"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="naigc:DocType=2">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Уведомление<br/>о необходимости представления дополнительной информации</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top">
									<td width="50%" class="bordered">
										<xsl:text>1. Таможенный орган, направивший уведомление о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates mode="spaced" select="naigc:Customs"/>
										</i>
									</td>
									<td width="50%" class="bordered">
										<xsl:text>2. Сведения о заявителе</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:Declarant"/>
										</i>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="bordered">
										<xsl:text>3. Регистрационный номер уведомления о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:value-of select="naigc:NotifNumber"/>
										</i>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered">
										<xsl:text>4. Регистрационный номер заявления о принятии предварительного решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:value-of select="naigc:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
										</i>
									</td>
									<td class="bordered">
										<xsl:text>5. Дата заявления о принятии предварительного решения о классификации товара в соответствии с ТН ВЭД ЕАЭС (число, месяц, год)</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="naigc:ApplicationRegistration/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>6. Наименование товара, указанного в заявлении о принятии предварительного решения о классификации товара в соответствии с ТН ВЭД ЕАЭС</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:GoodsDescription"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>7. Обоснование необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:Reason"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>8. Перечень дополнительно запрашиваемых документов и (или) сведений:</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:RequestedInfo"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>9. Должностное лицо таможенного органа, принявшее решение о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<xsl:apply-templates select="naigc:CustomsPerson" mode="kind2"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="naigc:DocType=3">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Уведомление<br/>о необходимости представления дополнительной информации</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top">
									<td width="50%" class="bordered">
										<xsl:text>1. Таможенный орган, направивший запрос о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates mode="spaced" select="naigc:Customs"/>
										</i>
									</td>
									<td width="50%" class="bordered">
										<xsl:text>2. Сведения о заявителе</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:Declarant"/>
										</i>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="bordered">
										<xsl:text>3. Регистрационный номер запроса о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:value-of select="naigc:NotifNumber"/>
										</i>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered">
										<xsl:text>4. Номер заявления о принятии предварительного решения о происхождении товара</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:value-of select="naigc:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
										</i>
									</td>
									<td class="bordered">
										<xsl:text>5. Дата заявления о принятии предварительного решения о происхождении товара (число, месяц, год)</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="naigc:ApplicationRegistration/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>6. Наименование товара, указанного в заявлении о принятии предварительного решения о происхождении товара</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:GoodsDescription"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>7. Обоснование необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:Reason"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>8. Перечень дополнительно запрашиваемых документов и (или) сведений</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:RequestedInfo"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>9. Должностное лицо таможенного органа, принявшее решение о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<xsl:apply-templates select="naigc:CustomsPerson" mode="kind2"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="naigc:DocType=4">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<b>Уведомление<br/>о подаче последней ДТ</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top">
									<td width="50%" class="bordered">
										<xsl:text>1. Таможенный орган, направивший уведомление о подаче последней ДТ</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates mode="spaced" select="naigc:Customs"/>
										</i>
									</td>
									<td width="50%" class="bordered">
										<xsl:text>2. Сведения о заявителе</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:Declarant"/>
										</i>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="bordered">
										<xsl:text>3. Регистрационный номер уведомления о подаче последней ДТ</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:value-of select="naigc:NotifNumber"/>
										</i>
									</td>
								</tr>
								<!--tr valign="top">
									<td class="bordered">
										<xsl:text>4. Номер заявления о принятии предварительного решения о происхождении товара</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:value-of select="naigc:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
										</i>
									</td>
									<td class="bordered">
										<xsl:text>5. Дата заявления о принятии предварительного решения о происхождении товара (число, месяц, год)</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="naigc:ApplicationRegistration/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>6. Наименование товара, указанного в заявлении о принятии предварительного решения о происхождении товара</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:GoodsDescription"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>7. Обоснование необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:Reason"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>8. Перечень дополнительно запрашиваемых документов и (или) сведений</xsl:text>
										<br/>
										<br/>
										<i>
											<xsl:apply-templates select="naigc:RequestedInfo"/>
										</i>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="2">
										<xsl:text>9. Должностное лицо таможенного органа, принявшее решение о необходимости представления дополнительной информации</xsl:text>
										<br/>
										<br/>
										<xsl:apply-templates select="naigc:CustomsPerson" mode="kind2"/>
									</td>
								</tr-->
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="naigc:Declarant">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<br/>
			<xsl:text>ОКПО </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">
			<br/>
			<xsl:text>ОКАТО </xsl:text>
			<xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<br/>
			<xsl:text>Адрес: </xsl:text>
			<xsl:apply-templates select="cat_ru:Address" mode="comma"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">
			<br/>
			<xsl:text>Контакты: </xsl:text>
			<xsl:apply-templates select="cat_ru:Contact"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="naigc:CustomsPerson" mode="kind2">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"/>
					<td width="30%" class="value"/>
					<td width="5%"/>
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr valign="top">
					<td width="30%" class="descr">(должность)</td>
					<td width="5%"/>
					<td width="30%" class="descr">(подпись)</td>
					<td width="5%"/>
					<td width="30%" class="descr">(Ф.И.О.)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="naigc:CustomsPerson">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"/>
					<td width="30%" class="value"/>
					<td width="5%"/>
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
				<tr valign="top">
					<td width="30%" class="descr">должность лица таможенного органа, подписавшего уведомление</td>
					<td width="5%"/>
					<td width="30%" class="descr">подпись</td>
					<td width="5%"/>
					<td width="30%" class="descr">инициалы, фамилия</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="comma">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexData"/>
						</sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexDescr"/>
						</sup>
					</td>
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
