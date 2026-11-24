<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="gc  cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:gc="urn:customs.ru:Information:CommercialFinanceDocuments:GuaranteeContract:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<!-- Шаблон для типа GuaranteeContract -->
	<xsl:template match="gc:GuaranteeContract">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Договор поручительства</title>
				<style type="text/css">
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 210mm;
					max-width: 210mm;
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
					vertical-align:bottom;
					font-style:italic;}

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
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}

					.delim
					{height: 7pt;}

					.delim_3
					{height: 3pt;}

					.indent
					{text-indent: 1.5em;}
				</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="gc:GuaranteeContractKind='1'">
						<div class="page">
							<!-- Шапка -->
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Договор</xsl:text>
											<br/>
											<xsl:text>поручительства, применяемый в качестве генерального</xsl:text>
											<br/>
											<xsl:text>обеспечения исполнения обязанности по уплате таможенных</xsl:text>
											<br/>
											<xsl:text>пошлин, налогов, таможенных сборов, специальных,</xsl:text>
											<br/>
											<xsl:text>антидемпинговых, компенсационных пошлин при совершении</xsl:text>
											<br/>
											<xsl:text>нескольких таможенных операций в определенный</xsl:text>
											<br/>
											<xsl:text>период времени</xsl:text></b>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>
											<xsl:choose>
												<xsl:when test="gc:StatusDetails/gc:Status='0' or gc:StatusDetails/gc:Status='f' or gc:StatusDetails/gc:Status='false'">
													<u>
														<xsl:text>новый</xsl:text>
													</u>
												</xsl:when>
												<xsl:when test="gc:StatusDetails/gc:Status='1' or gc:StatusDetails/gc:Status='t' or gc:StatusDetails/gc:Status='true'">
													<u>
														<xsl:text>заключен</xsl:text>
													</u>
												</xsl:when>
											</xsl:choose>
										</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="gc:StatusDetails/gc:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							<!-- Основная информация -->
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<!--xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text-->
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с другой стороны, вместе именуемые «Стороны», заключили настоящий Договор на основании статей 63 и 64 Таможенного кодекса Евразийского экономического союза<!-- (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)--> (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза», далее - Кодекс), статей 59, 62 и 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»<!-- (Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082; № 49, ст. 7524)--> (далее - Федеральный закон), статьи 6 Федерального закона от 6 апреля 2011 г. № 63-ФЗ «Об электронной подписи»<!-- (Собрание законодательства Российской Федерации, 2011, № 15, ст. 2036; 2016, № 26, ст. 3889)-->, статей 361 - 367 Гражданского кодекса Российской Федерации<!-- (Собрание законодательства Российской Федерации, 1994, № 32, ст. 3301; 2015, № 10, ст. 1412)--> о нижеследующем.</xsl:text>
							</div>
							<!-- Предмет договора -->
							<div style="text-align: justify">
								<p align="center" class="head">I. Предмет Договора</p>
								<br/>
								<xsl:text>1.1. По настоящему Договору Поручитель обязуется отвечать перед Кредитором за исполнение</xsl:text>
								<br/>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:for-each select="gc:Debtor">
											<xsl:if test="position()!=1">; </xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(для организации: наименование, адрес, указанный в Едином государственном реестре юридических лиц, идентификационный номер налогоплательщика (далее - ИНН), банковские реквизиты; для физического лица: фамилия, имя, отчество (при наличии), наименование документа, удостоверяющего личность, серия и номер такого документа, место жительства, ИНН (при наличии); основной государственный регистрационный номер индивидуального предпринимателя (для индивидуальных предпринимателей))'"/>
									<xsl:with-param name="width" select="'100%'"/>
								</xsl:call-template>
								<br/>
								<xsl:text>именуемого в дальнейшем «Должник», обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, возникающей у Должника в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании при совершении Должником нескольких таможенных операций в определенный период времени, в том числе такой обязанности, которая может возникнуть в будущем, в сумме не более </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:ObligationAmount"/>
										<xsl:if test="gc:ObligationAmountText">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="gc:ObligationAmountText"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(цифрами и прописью)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> рублей.</xsl:text>
								<br/>
								<xsl:text>1.2. Размер финансовых обязательств Поручителя по настоящему Договору уменьшается на суммы платежей, осуществленных Поручителем</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, суммы денежных средств, взысканных по банковской гарантии</xsl:text>
								</xsl:if>
								<!--sup>1</sup-->
								<xsl:text>, и суммы денежных средств, списанных с банковского счета Поручителя, в случае неисполнения или ненадлежащего исполнения Должником обязанности, указанной в пункте 1.1 настоящего Договора.</xsl:text>
							</div>
							<!-- Взаимодействие сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">II. Взаимодействие Сторон</p>
								<br/>
								<xsl:text>2.1. Обязанности Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.1.1. Отвечать перед Кредитором солидарно с Должником при неисполнении или ненадлежащем исполнении Должником обязанности, указанной в пункте 1.1 настоящего Договора.</xsl:text>
								<br/>
								<xsl:text>2.1.2. Уплатить суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, в течение 5 (пяти) рабочих дней со дня получения требования об уплате денежной суммы по договору поручительства (далее - Требование), направленного таможенным органом Российской Федерации, осуществляющим взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, на банковский счет, указанный в Требовании, при неисполнении или ненадлежащем исполнении Должником обязанности, указанной в пункте 1.1 настоящего Договора.</xsl:text>
								<br/>
								<xsl:text>2.1.3. Уплатить суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, на банковский счет, указанный в Требовании, в случае отклонения таможенным органом Российской Федерации, направившим Требование, возражений, представленных Поручителем в соответствии с пунктом 2.2.1 настоящего Договора, в течение 1 (одного) рабочего дня с момента получения повторного Требования.</xsl:text>
								<br/>
								<xsl:text>2.1.4. Предоставить таможенным органам Российской Федерации право на списание денежных средств с банковского счета Поручителя, включив в договор банковского счета между Поручителем и кредитной организацией, в которой Поручителю открыт банковский счет, право таможенных органов Российской Федерации предъявлять соответствующие распоряжения к указанному банковскому счету.</xsl:text>
								<br/>
								<xsl:text>2.1.5. Представить Кредитору одновременно оригинал и копию договора банковского счета или дополнительного соглашения к договору банковского счета, содержащего положения о праве таможенных органов Российской Федерации, указанном в пункте 2.1.4 настоящего Договора. Таможенный орган Российской Федерации проверяет соответствие копии представленного документа его оригиналу, после чего оригинал документа возвращается Поручителю.</xsl:text>
								<br/>
								<xsl:text>2.1.6. Информировать Кредитора о закрытии банковского счета в кредитной организации, указанного в пункте 2.1.4 настоящего Договора, с одновременным представлением одного из документов, предусмотренных пунктом 2.1.5 настоящего Договора, по иному банковскому счету Поручителя.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.1.7. Обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии, выданной банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, по которой бенефициаром выступает Кредитор, в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору, путем представления Кредитору оригинала указанной банковской гарантии</xsl:text>
									<!--sup>2</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.8. Представляемая банковская гарантия должна являться безотзывной и содержать условие об обеспечении обязательств Поручителя по настоящему Договору. Банковская гарантия на день ее представления Кредитору должна быть вступившей в силу, а срок ее действия должен истекать не позднее чем за 3 (три) месяца до дня истечения установленного срока действия настоящего Договора</xsl:text>
									<!--sup>3</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.9. Если по истечении срока действия настоящего Договора Поручитель оспаривает Требование, представленное в период срока действия настоящего Договора, на период рассмотрения спора Поручитель предоставляет Кредитору банковскую гарантию в размере, указанном в Требовании</xsl:text>
									<!--sup>4</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.2. Права Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.2.1. Выдвигать против Требования возражения, которые мог бы представить Должник, в пределах срока, указанного в пункте 2.1.2 настоящего Договора.</xsl:text>
								<br/>
								<br/>
								<xsl:text>2.3. Обязанности Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.3.1. Обеспечить передачу Поручителю в течение 10 (десяти) рабочих дней после исполнения им обязанности, указанной в пункте 1.1 настоящего Договора, документов, удостоверяющих требование к Должнику, на основании которых Поручитель может предъявить к Должнику регрессное требование.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.3.2. Принимать от Поручителя банковскую гарантию, выданную банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, если условия такой банковской гарантии обеспечивают надлежащим образом обязательства Поручителя, а ее условия соответствуют положениям законодательства Российской Федерации и настоящего Договора</xsl:text>
									<!--sup>5</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.4. Права Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.4.1. Направить Поручителю Требование при неисполнении или ненадлежащем исполнении Должником обязанности, указанной в пункте 1.1 настоящего Договора.</xsl:text>
								<br/>
								<xsl:text>2.4.2. Предъявить инкассовые поручения к банковскому счету Поручителя, указанному в пункте 2.1.4 настоящего Договора, на списание с указанного счета сумм таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:CollOrderReason='1'">если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:when>
									<xsl:otherwise>в случае невозможности взыскания таких сумм по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора.</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.4.3. Отказать в приеме банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, с указанием причин отказа, если условия такой банковской гарантии не обеспечивают надлежащим образом обязательства Поручителя, а также не соответствуют положениям законодательства Российской Федерации и (или) настоящего Договора</xsl:text>
									<!--sup>6</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.4.4. Взыскать суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование</xsl:text>
									<!--sup>7</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
							</div>
							<!-- Ответственность Сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">III. Ответственность Сторон</p>
								<br/>
								<xsl:text>3.1. Поручитель уплачивает неустойку в размере 0,1 процента суммы, подлежащей уплате, за каждый календарный день просрочки, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:text>
								<br/>
								<xsl:text>3.2. Уплата неустойки не освобождает Поручителя от исполнения обязательств по настоящему Договору.</xsl:text>
							</div>
							<!-- Срок действия Договора -->
							<div style="text-align: justify">
								<p align="center" class="head">IV. Срок действия Договора</p>
								<br/>
								<xsl:text>4.1. Настоящий Договор вступает в силу с даты</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text> предоставления Кредитору в соответствии с пунктом 2.1.7 настоящего Договора банковской гарантии, но не ранее даты </xsl:text>
								</xsl:if>
								<!--sup>8</sup-->
								<xsl:text> получения Кредитором оригинала и копии одного из документов, указанных в пункте 2.1.5 настоящего Договора, и действует до </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:ValidityDate"/>
								</xsl:call-template>
								<xsl:text> включительно.</xsl:text>
								<br/>
								<xsl:text>4.2. Настоящий Договор может быть расторгнут досрочно по соглашению Сторон в случаях, когда обязанность, указанная в пункте 1.1 настоящего Договора, исполнена в полном объеме, прекращена либо не возникла или когда взамен поручительства принято другое обеспечение.</xsl:text>
							</div>
							<!-- Прочие условия -->
							<div style="text-align: justify">
								<p align="center" class="head">V. Прочие условия</p>
								<br/>
								<xsl:text>5.1. Настоящий Договор, внесение в него изменений и (или) дополнений к нему могут заключаться в виде документа на бумажном носителе или электронного документа, подписанного усиленными квалифицированными электронными подписями Сторон (уполномоченных представителей Сторон). Юридически значимые сообщения в рамках настоящего Договора могут направляться Сторонами в виде документа на бумажном носителе или электронного документа, подписанного усиленной квалифицированной электронной подписью Стороны (уполномоченного представителя Стороны). Настоящий Договор, внесение в него изменений и (или) дополнений к нему имеют юридическую силу после их подписания.</xsl:text>
								<br/>
								<xsl:text>5.2. Действия, предусмотренные пунктами 2.4.1, 2.4.2</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, 2.4.4</xsl:text>
								</xsl:if>
								<!--sup>9</sup-->
								<xsl:text> настоящего Договора, в соответствии с частью 2 статьи 76 Федерального закона вправе совершать таможенный орган Российской Федерации, осуществляющий взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней.</xsl:text>
								<br/>
								<xsl:text>5.3. Споры по настоящему Договору разрешаются Сторонами путем переговоров. В случае невозможности урегулирования спора путем переговоров он передается на рассмотрение в суд.</xsl:text>
								<br/>
								<xsl:text>5.4. Настоящий Договор составлен в 2-х экземплярах, имеющих одинаковую юридическую силу:</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Кредитора;</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Поручителя.</xsl:text>
							</div>
							<!-- Адреса и реквизиты Сторон -->
							<div>
								<p align="center" class="head">VI. Адреса и реквизиты Сторон</p>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td>
												<xsl:text>Кредитор:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Creditor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Creditor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Creditor/cat_ru:ShortName and not(gc:Creditor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Creditor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:Address">
															<xsl:for-each select="cat_ru:PostalCode | cat_ru:CounryName | cat_ru:Region | cat_ru:City | cat_ru:StreetHouse | cat_ru:TerritoryCode">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Поручитель:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Guarantor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Guarantor/cat_ru:ShortName and not(gc:Guarantor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Guarantor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='1']">
															<xsl:for-each select="RUScat_ru:PostalCode | RUScat_ru:CounryName | RUScat_ru:Region | RUScat_ru:District | RUScat_ru:Town | RUScat_ru:City | RUScat_ru:StreetHouse | RUScat_ru:House | RUScat_ru:Room | RUScat_ru:AddressText">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<table style="page-break-inside: avoid;">
													<tbody>
														<tr>
															<td width="50%">
																<xsl:text>от Кредитора</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Creditor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
															<td width="50%">
																<xsl:text>от Поручителя</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Guarantor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Примечания -->
							<!--div class="descr" style="text-align: justify">
								<hr/>
								<sup>1</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>2</sup>
								<xsl:text>, </xsl:text>
								<sup>3</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>4</sup>
								<xsl:text>, </xsl:text>
								<sup>5</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>6</sup>
								<xsl:text>, </xsl:text>
								<sup>7</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>8</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>9</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
							</div-->
						</div>
					</xsl:when>
					<xsl:when test="gc:GuaranteeContractKind='2'">
						<div class="page">
							<!-- Шапка -->
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Договор</xsl:text>
											<br/>
											<xsl:text>поручительства, обеспечивающий в отношении одного лица</xsl:text>
											<br/>
											<xsl:text>исполнение </xsl:text>
											<xsl:choose>
												<xsl:when test="gc:Debtor/gc:ActivitiesKind='1'">
													<xsl:text>обязанностей юридического лица,</xsl:text>
													<br/>
													<xsl:text>осуществляющего деятельность в сфере таможенного дела</xsl:text>
												</xsl:when>
												<xsl:when test="gc:Debtor/gc:ActivitiesKind='2'">
													<xsl:text>обязанностей уполномоченного экономического оператора</xsl:text>
												</xsl:when>
												<xsl:when test="gc:Debtor/gc:ActivitiesKind='3'">
													<xsl:text>обязанностей юридического лица,</xsl:text>
													<br/>
													<xsl:text>осуществляющего деятельность в сфере таможенного дела,</xsl:text>
													<br/>
													<xsl:text>и обязанностей уполномоченного экономического оператора</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="gc:Debtor/gc:ActivitiesKind"/>
												</xsl:otherwise>
											</xsl:choose></b>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>
											<xsl:choose>
												<xsl:when test="gc:StatusDetails/gc:Status='0' or gc:StatusDetails/gc:Status='f' or gc:StatusDetails/gc:Status='false'">
													<u>
														<xsl:text>новый</xsl:text>
													</u>
												</xsl:when>
												<xsl:when test="gc:StatusDetails/gc:Status='1' or gc:StatusDetails/gc:Status='t' or gc:StatusDetails/gc:Status='true'">
													<u>
														<xsl:text>заключен</xsl:text>
													</u>
												</xsl:when>
											</xsl:choose>
										</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="gc:StatusDetails/gc:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							<!-- Основная информация -->
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<!--xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text-->
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с другой стороны, вместе именуемые «Стороны», заключили настоящий Договор на основании статьи 63 Таможенного кодекса Евразийского экономического союза<!-- (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)--> (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза», далее - Кодекс), статей 62 и 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»<!-- (Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082; № 49, ст. 7524)--> (далее - Федеральный закон), статьи 6 Федерального закона от 6 апреля 2011 г. № 63-ФЗ «Об электронной подписи»<!-- (Собрание законодательства Российской Федерации, 2011, № 15, ст. 2036; 2016, № 26, ст. 3889)-->, статей 361 - 367 Гражданского кодекса Российской Федерации<!-- (Собрание законодательства Российской Федерации, 1994, № 32, ст. 3301; 2015, № 10, ст. 1412)--> о нижеследующем.</xsl:text>
							</div>
							<!-- Предмет договора -->
							<div style="text-align: justify">
								<p align="center" class="head">I. Предмет Договора</p>
								<br/>
								<xsl:text>1.1. По настоящему Договору Поручитель обеспечивает перед Кредитором исполнение </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='1'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='2'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного перевозчика</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='3'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя и таможенного перевозчика</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='4'">
										<xsl:text>обязанностей уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='5'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя, и обязанности уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='6'">
										<xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного перевозчика, и обязанности уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='7'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя, таможенного перевозчика, и обязанности уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='8'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца свободного склада</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='9'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца склада временного хранения</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='10'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца таможенного склада</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='11'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца магазина беспошлинной торговли</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="gc:Debtor/gc:ActivitiesKindDetails"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> в отношении</xsl:text>
								<br/>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:for-each select="gc:Debtor">
											<xsl:if test="position()!=1">; </xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование юридического лица, осуществляющего деятельность (претендующего на осуществление деятельности) в сфере таможенного дела, и (или) включенного (претендующего на включение) в реестр уполномоченных экономических операторов, адрес, указанный в Едином государственном реестре юридических лиц, идентификационный номер налогоплательщика, банковские реквизиты)'"/>
									<xsl:with-param name="width" select="'100%'"/>
								</xsl:call-template>
								<br/>
								<xsl:text>именуемого в дальнейшем «Должник», в том числе таких обязанностей, которые могут возникнуть в будущем, сумме не более </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:ObligationAmount"/>
										<xsl:if test="gc:ObligationAmountText">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="gc:ObligationAmountText"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(цифрами и прописью)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> рублей.</xsl:text>
								<br/>
								<xsl:text>1.2. Размер финансовых обязательств Поручителя по настоящему Договору уменьшается на суммы платежей, осуществленных Поручителем</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, суммы денежных средств, взысканных по банковской гарантии</xsl:text>
								</xsl:if>
								<!--sup>1</sup-->
								<xsl:text>, и суммы денежных средств, списанных с банковского счета Поручителя.</xsl:text>
							</div>
							<!-- Взаимодействие сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">II. Взаимодействие Сторон</p>
								<br/>
								<xsl:text>2.1. Обязанности Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.1.1. Отвечать перед Кредитором солидарно с Должником при неисполнении или ненадлежащем исполнении Должником обязанностей, указанных в пункте 1.1 настоящего Договора.</xsl:text>
								<br/>
								<xsl:text>2.1.2. Уплатить при неисполнении или ненадлежащем исполнении Должником обязанностей, указанных в пункте 1.1 настоящего Договора, суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, в случаях, когда у Должника в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, возникает обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов либо Должник несет солидарную обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов с плательщиком таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, в течение 5 (пяти) рабочих дней со дня получения требования об уплате денежной суммы по договору поручительства (далее - Требование), направленного таможенным органом Российской Федерации, осуществляющим взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, на банковский счет, указанный в Требовании.</xsl:text>
								<br/>
								<xsl:text>2.1.3. Уплатить суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, причитающиеся в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, на банковский счет, указанный в Требовании, в случае отклонения таможенным органом Российской Федерации, направившим Требование, возражений, представленных Поручителем в соответствии с пунктом 2.2.1 настоящего Договора, в течение 1 (одного) рабочего дня с момента получения повторного Требования.</xsl:text>
								<br/>
								<xsl:text>2.1.4. Предоставить таможенным органам Российской Федерации право на списание денежных средств с банковского счета Поручителя, включив в договор банковского счета между Поручителем и кредитной организацией, в которой Поручителю открыт банковский счет, право таможенных органов Российской Федерации предъявлять соответствующие распоряжения к указанному банковскому счету.</xsl:text>
								<br/>
								<xsl:text>2.1.5. Представить Кредитору одновременно оригинал и копию договора банковского счета или дополнительного соглашения к договору банковского счета, содержащего положения о праве таможенных органов Российской Федерации, указанном в пункте 2.1.4 настоящего Договора. Таможенный орган Российской Федерации проверяет соответствие копии представленного документа его оригиналу, после чего оригинал документа возвращается Поручителю.</xsl:text>
								<br/>
								<xsl:text>2.1.6. Информировать Кредитора о закрытии банковского счета в кредитной организации, указанного в пункте 2.1.4 настоящего Договора, с одновременным представлением одного из документов, предусмотренных пунктом 2.1.5 настоящего Договора, по иному банковскому счету Поручителя.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.1.7. Обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии, выданной банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, по которой бенефициаром выступает Кредитор, в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору, путем представления Кредитору оригинала указанной банковской гарантии</xsl:text>
									<!--sup>2</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.8. Представляемая банковская гарантия должна являться безотзывной и содержать условие об обеспечении обязательств Поручителя по настоящему Договору. Банковская гарантия на день ее представления Кредитору должна быть вступившей в силу, а срок ее действия должен истекать не ранее чем через 3 (три) месяца со дня истечения установленного срока действия настоящего Договора</xsl:text>
									<!--sup>3</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.9. Если по истечении срока действия настоящего Договора Поручитель оспаривает Требование, представленное в период срока действия настоящего Договора, на период рассмотрения спора Поручитель предоставляет Кредитору банковскую гарантию в размере, указанном в Требовании</xsl:text>
									<!--sup>4</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.2. Права Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.2.1. Выдвигать против Требования возражения, которые мог бы представить Должник, в пределах срока, указанного в пункте 2.1.2 настоящего Договора.</xsl:text>
								<br/>
								<br/>
								<xsl:text>2.3. Обязанности Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.3.1. Обеспечить передачу Поручителю в течение 10 (десяти) рабочих дней после исполнения им обязанности, указанной в пункте 1.1 настоящего Договора, документов, удостоверяющих требование к Должнику, на основании которых Поручитель может предъявить к Должнику регрессное требование.</xsl:text>
								<xsl:if test="gc:CollOrderReason = 2">
									<br/>
									<xsl:text>2.3.2. Принимать от Поручителя банковскую гарантию, выданную банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, если условия такой банковской гарантии обеспечивают надлежащим образом обязательства Поручителя, а ее условия соответствуют положениям законодательства Российской Федерации и настоящего Договора.</xsl:text>
								</xsl:if>
								<!--sup>5</sup-->
								<!--xsl:text>.</xsl:text-->
								<br/>
								<br/>
								<xsl:text>2.4. Права Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.4.1. Направить Поручителю Требование при неисполнении или ненадлежащем исполнении Должником обязанностей, указанных в пункте 1.1 настоящего Договора.</xsl:text>
								<br/>
								<xsl:text>2.4.2. Предъявить инкассовые поручения к банковскому счету Поручителя, указанному в пункте 2.1.4 настоящего Договора, на списание с указанного счета сумм таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, причитающихся в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:CollOrderReason='1'">если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:when>
									<xsl:otherwise>в случае невозможности взыскания таких сумм по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора.</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.4.3. Отказать в приеме банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, с указанием причин отказа, если условия такой банковской гарантии не обеспечивают надлежащим образом обязательства Поручителя, а также не соответствуют положениям законодательства Российской Федерации и (или) настоящего Договора</xsl:text>
									<!--sup>6</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.4.4. Взыскать суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование</xsl:text>
									<!--sup>7</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
							</div>
							<!-- Ответственность Сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">III. Ответственность Сторон</p>
								<br/>
								<xsl:text>3.1. Поручитель уплачивает неустойку в размере 0,1 процента суммы, подлежащей уплате, за каждый календарный день просрочки, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:text>
								<br/>
								<xsl:text>3.2. Уплата неустойки не освобождает Поручителя от исполнения обязательств по настоящему Договору.</xsl:text>
							</div>
							<!-- Срок действия Договора -->
							<div style="text-align: justify">
								<p align="center" class="head">IV. Срок действия Договора</p>
								<br/>
								<xsl:text>4.1. Настоящий Договор вступает в силу с даты</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text> предоставления Кредитору в соответствии с пунктом 2.1.7 настоящего Договора банковской гарантии, но не ранее даты </xsl:text>
								</xsl:if>
								<!--sup>8</sup-->
								<xsl:text> получения Кредитором оригинала и копии одного из документов, указанных в пункте 2.1.5 настоящего Договора, и действует до </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:ValidityDate"/>
								</xsl:call-template>
								<xsl:text> включительно.</xsl:text>
								<br/>
								<xsl:text>4.2. Настоящий Договор может быть расторгнут досрочно по соглашению Сторон при отсутствии у Должника неисполненной в установленный срок обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов в случаях, указанных в пункте 13 статьи 399 Кодекса<!-- (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза» (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)-->, и (или) пункте 23 статьи 436 Кодекса<!-- (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза» (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)-->, и при соблюдении условий, установленных пунктом 25 статьи 436 Кодекса и (или) частью 7 статьи 57 Федерального закона<!-- (Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082)--> (в зависимости от обязанностей, указанных в пункте 1.1 настоящего Договора).</xsl:text>
							</div>
							<!-- Прочие условия -->
							<div style="text-align: justify">
								<p align="center" class="head">V. Прочие условия</p>
								<br/>
								<xsl:text>5.1. Настоящий Договор, внесение в него изменений и (или) дополнений к нему могут заключаться в виде документа на бумажном носителе или электронного документа, подписанного усиленными квалифицированными электронными подписями Сторон (уполномоченных представителей Сторон). Юридически значимые сообщения в рамках настоящего Договора могут направляться Сторонами в виде документа на бумажном носителе или электронного документа, подписанного усиленной квалифицированной электронной подписью Стороны (уполномоченного представителя Стороны). Настоящий Договор, внесение в него изменений и (или) дополнений к нему имеют юридическую силу после их подписания.</xsl:text>
								<br/>
								<xsl:text>5.2. Действия, предусмотренные пунктами 2.4.1, 2.4.2</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, 2.4.4</xsl:text>
								</xsl:if>
								<!--sup>9</sup-->
								<xsl:text> настоящего Договора, в соответствии с частью 2 статьи 76 Федерального закона вправе совершать таможенный орган Российской Федерации, осуществляющий взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней.</xsl:text>
								<br/>
								<xsl:text>5.3. Споры по настоящему Договору разрешаются Сторонами путем переговоров. В случае невозможности урегулирования спора путем переговоров он передается на рассмотрение в суд.</xsl:text>
								<br/>
								<xsl:text>5.4. Настоящий Договор составлен в 2-х экземплярах, имеющих одинаковую юридическую силу:</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Кредитора;</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Поручителя.</xsl:text>
							</div>
							<!-- Адреса и реквизиты Сторон -->
							<div>
								<p align="center" class="head">VI. Адреса и реквизиты Сторон</p>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td>
												<xsl:text>Кредитор:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Creditor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Creditor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Creditor/cat_ru:ShortName and not(gc:Creditor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Creditor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:Address">
															<xsl:for-each select="cat_ru:PostalCode | cat_ru:CounryName | cat_ru:Region | cat_ru:City | cat_ru:StreetHouse | cat_ru:TerritoryCode">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Поручитель:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Guarantor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Guarantor/cat_ru:ShortName and not(gc:Guarantor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Guarantor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='1']">
															<xsl:for-each select="RUScat_ru:PostalCode | RUScat_ru:CounryName | RUScat_ru:Region | RUScat_ru:District | RUScat_ru:Town | RUScat_ru:City | RUScat_ru:StreetHouse | RUScat_ru:House | RUScat_ru:Room | RUScat_ru:AddressText">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<table style="page-break-inside: avoid;">
													<tbody>
														<tr>
															<td width="50%">
																<xsl:text>от Кредитора</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Creditor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
															<td width="50%">
																<xsl:text>от Поручителя</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Guarantor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Примечания -->
							<!--div class="descr" style="text-align: justify">
								<hr/>
								<sup>1</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>2</sup>
								<xsl:text>, </xsl:text>
								<sup>3</sup>
								<xsl:text>, </xsl:text>
								<sup>4</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>5</sup>
								<xsl:text>, </xsl:text>
								<sup>6</sup>
								<xsl:text>, </xsl:text>
								<sup>7</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>8</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>9</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
							</div-->
						</div>
					</xsl:when>
					<xsl:when test="gc:GuaranteeContractKind='3'">
						<div class="page">
							<!-- Шапка -->
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Договор</xsl:text>
											<br/>
											<xsl:text>поручительства, обеспечивающий в отношении нескольких лиц</xsl:text>
											<br/>
											<xsl:text>исполнение обязанностей юридического лица, осуществляющего</xsl:text>
											<br/>
											<xsl:text>деятельность в сфере таможенного дела, и (или) исполнение</xsl:text>
											<br/>
											<xsl:text>обязанностей уполномоченного экономического оператора</xsl:text></b>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>
											<xsl:choose>
												<xsl:when test="gc:StatusDetails/gc:Status='0' or gc:StatusDetails/gc:Status='f' or gc:StatusDetails/gc:Status='false'">
													<u>
														<xsl:text>новый</xsl:text>
													</u>
												</xsl:when>
												<xsl:when test="gc:StatusDetails/gc:Status='1' or gc:StatusDetails/gc:Status='t' or gc:StatusDetails/gc:Status='true'">
													<u>
														<xsl:text>заключен</xsl:text>
													</u>
												</xsl:when>
											</xsl:choose>
										</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="gc:StatusDetails/gc:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							<!-- Основная информация -->
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<!--xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text-->
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с другой стороны, вместе именуемые «Стороны», заключили настоящий Договор на основании статей 63 Таможенного кодекса Евразийского экономического союза<!-- (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)--> (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза», далее - Кодекс), статей 62 и 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»<!-- (Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082; № 49, ст. 7524)--> (далее - Федеральный закон), статьи 6 Федерального закона от 6 апреля 2011 г. № 63-ФЗ «Об электронной подписи»<!-- (Собрание законодательства Российской Федерации, 2011, № 15, ст. 2036; 2016, № 26, ст. 3889)-->, статей 361 - 367 Гражданского кодекса Российской Федерации<!-- (Собрание законодательства Российской Федерации, 1994, № 32, ст. 3301; 2015, № 10, ст. 1412)--> о нижеследующем.</xsl:text>
							</div>
							<!-- Предмет договора -->
							<div style="text-align: justify">
								<p align="center" class="head">I. Предмет Договора</p>
								<br/>
								<xsl:text>1.1. По настоящему Договору Поручитель обеспечивает перед Кредитором в отношении нескольких лиц, именуемых в дальнейшем «Должник», исполнение обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и (или) исполнение обязанностей уполномоченного экономического оператора, в том числе таких обязанностей, которые могут возникнуть в будущем.</xsl:text>
								<br/>
								<xsl:text>1.2. Должник и сведения об обеспечиваемых поручительством обязанностях, а также размеры денежных обязательств Поручителя за каждого Должника и сроки, на которые дано поручительство за каждого Должника, указываются в дополнениях к настоящему Договору (далее - Дополнения), которые являются его неотъемлемой частью.</xsl:text>
								<br/>
								<xsl:text>1.3. Размер финансовых обязательств Поручителя по конкретному Дополнению уменьшается на суммы платежей, осуществленных Поручителем<!--, суммы денежных средств, взысканных по банковской гарантии--></xsl:text>
								<!--sup>1</sup-->
								<xsl:text>, и суммы денежных средств, списанных с банковского счета Поручителя, в случае неисполнения или ненадлежащего исполнения Должником обязанности, указанной в таком Дополнении.</xsl:text>
							</div>
							<!-- Взаимодействие сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">II. Взаимодействие Сторон</p>
								<br/>
								<xsl:text>2.1. Обязанности Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.1.1. Отвечать перед Кредитором солидарно с Должниками при неисполнении или ненадлежащем исполнении Должниками обязанностей, предусмотренных пунктом 1.1 настоящего Договора и указанных в Дополнениях, обеспечивающих обязательства таких Должников.</xsl:text>
								<br/>
								<xsl:text>2.1.2. Уплатить при неисполнении или ненадлежащем исполнении конкретным Должником обязанностей, указанных в Дополнении, обеспечивающем обязательства такого Должника, суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, в случаях, когда у Должника в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании возникает обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов либо указанный Должник несет солидарную обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов, пеней с плательщиком таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, в течение 5 (пяти) рабочих дней со дня получения требования об уплате денежной суммы по договору поручительства (далее - Требование), направленного таможенным органом Российской Федерации, осуществляющим взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, на банковский счет, указанный в Требовании.</xsl:text>
								<br/>
								<xsl:text>2.1.3. Уплатить суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, на банковский счет, указанный в Требовании, в случае отклонения таможенным органом Российской Федерации, направившим Требование, возражений, представленных Поручителем в соответствии с пунктом 2.2.1 настоящего Договора, в течение 1 (одного) рабочего дня с момента получения повторного Требования.</xsl:text>
								<br/>
								<xsl:text>2.1.4. Предоставить таможенным органам Российской Федерации право на списание денежных средств с банковского счета Поручителя, включив в договор банковского счета между Поручителем и кредитной организацией, в которой Поручителю открыт банковский счет, право таможенных органов Российской Федерации предъявлять соответствующие распоряжения к указанному банковскому счету.</xsl:text>
								<br/>
								<xsl:text>2.1.5. Представить Кредитору одновременно оригинал и копию договора банковского счета или дополнительного соглашения к договору банковского счета, содержащего положения о праве таможенных органов Российской Федерации, указанном в пункте 2.1.4 настоящего Договора. Таможенный орган Российской Федерации проверяет соответствие копии представленного документа его оригиналу, после чего оригинал документа возвращается Поручителю.</xsl:text>
								<br/>
								<xsl:text>2.1.6. Информировать Кредитора о закрытии банковского счета в кредитной организации, указанного в пункте 2.1.4 настоящего Договора, с одновременным представлением одного из документов, предусмотренных пунктом 2.1.5 настоящего Договора, по иному банковскому счету Поручителя.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.1.7. Обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии, выданной банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, по которой бенефициаром выступает Кредитор, в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору путем представления Кредитору оригинала указанной банковской гарантии</xsl:text>
									<!--sup>2</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.8. Представляемая банковская гарантия должна являться безотзывной и содержать условие об обеспечении обязательств Поручителя по настоящему Договору. Обязательства Поручителя по настоящему Договору должны обеспечиваться непрерывно в течение всего срока действия настоящего Договора</xsl:text>
									<!--sup>3</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.9. Если по истечении срока действия настоящего Договора Поручитель оспаривает Требование, представленное в период срока действия настоящего Договора, на период рассмотрения спора Поручитель предоставляет Кредитору банковскую гарантию в размере, указанном в Требовании</xsl:text>
									<!--sup>4</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.2. Права Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.2.1. Выдвигать против Требования возражения, которые мог бы представить Должник, в пределах срока, указанного в пункте 2.1.2 настоящего Договора.</xsl:text>
								<br/>
								<br/>
								<xsl:text>2.3. Обязанности Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.3.1. Обеспечить передачу Поручителю в течение 10 (десяти) рабочих дней после исполнения им обязанностей, предусмотренных пунктом 1.1 настоящего Договора и указанных в Дополнении, документов, удостоверяющих требование к Должнику, на основании которых Поручитель может предъявить к Должнику регрессное требование.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.3.2. Принимать от Поручителя банковскую гарантию, выданную банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, если условия такой банковской гарантии обеспечивают надлежащим образом обязательства Поручителя, а ее условия соответствуют положениям законодательства Российской Федерации и настоящего Договора.</xsl:text>
									<!--sup>5</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.4. Права Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.4.1. Направить Поручителю Требование при неисполнении или ненадлежащем исполнении конкретным Должником обязанностей, предусмотренных пунктом 1.1 настоящего Договора и указанных в Дополнении, обеспечивающем обязательства такого Должника.</xsl:text>
								<br/>
								<xsl:text>2.4.2. Предъявить инкассовые поручения к банковскому счету Поручителя, указанному в пункте 2.1.4 настоящего Договора, на списание с указанного счета сумм таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, причитающихся в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:CollOrderReason='1'">если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:when>
									<xsl:otherwise>в случае невозможности взыскания таких сумм по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора.</xsl:otherwise>
								</xsl:choose>
								<br/>
								<xsl:text>2.4.3. Не заключать новые Дополнения в случаях:</xsl:text>
								<xsl:if test="gc:CollOrderReason = 1">
									<br/>
									<xsl:text>– несоответствия Поручителя критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона, - до даты, когда Поручитель будет соответствовать таким критериям</xsl:text>
									<!--sup>6</sup-->
									<xsl:text>;</xsl:text>
								</xsl:if>
								<br/>
								<xsl:text>– неисполнения Поручителем Требования или не поступления от него возражений в срок, установленный пунктом 2.1.2 настоящего Договора, а также не исполнения Поручителем повторного Требования в срок, установленный пунктом 2.1.3 настоящего Договора, - до прекращения в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании у Должника обязанности (солидарной обязанности) по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, указанной в Требовании (повторном Требовании);</xsl:text>
								<br/>
								<xsl:text>– неисполнения Поручителем обязанности, предусмотренной пунктом 2.1.6 настоящего Договора, - до представления одного из документов, предусмотренных пунктом 2.1.5 настоящего Договора, по иному банковскому счету Поручителя</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>;</xsl:text>
									<br/>
									<xsl:text>– необеспечения Поручителем надлежащего исполнения своих обязательств перед таможенными органами Российской Федерации в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору, - до представления в соответствии с пунктом 2.1.7 настоящего Договора банковской гарантии</xsl:text>
									<!--sup>7</sup-->
								</xsl:if>
								<xsl:text>.</xsl:text>
								<br/>
								<xsl:text>2.4.4. Расторгнуть настоящий Договор в одностороннем порядке посредством уведомления Поручителя в случае, когда прекратилось действие всех Дополнений, заключенных в период действия настоящего Договора, и </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:ReasonForTerminatingContract='1'">хотя бы по одному такому Дополнению обязанность (солидарная обязанность) по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, указанная в Требовании, не была прекращена в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, по истечении 3 (трех) месяцев со дня направления такого Требования.</xsl:when>
									<xsl:otherwise>Поручителем в общей сложности в течение более 3 (трех) месяцев не обеспечено надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору.</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.4.5. Взыскать суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование</xsl:text>
									<!--sup>8</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.4.6. Отказать в приеме банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, с указанием причин отказа, если условия такой банковской гарантии не обеспечивают надлежащим образом обязательства Поручителя, а также не соответствуют положениям законодательства Российской Федерации и (или) настоящего Договора</xsl:text>
									<!--sup>9</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
							</div>
							<!-- Ответственность Сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">III. Ответственность Сторон</p>
								<br/>
								<xsl:text>3.1. Поручитель уплачивает неустойку в размере 0,1 процента суммы, подлежащей уплате, за каждый календарный день просрочки, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:text>
								<br/>
								<xsl:text>3.2. Уплата неустойки не освобождает Поручителя от исполнения обязательств по настоящему Договору.</xsl:text>
							</div>
							<!-- Срок действия Договора -->
							<div style="text-align: justify">
								<p align="center" class="head">IV. Срок действия Договора</p>
								<br/>
								<xsl:text>4.1. Настоящий Договор вступает в силу с даты</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text> предоставления Кредитору в соответствии с пунктом 2.1.7 настоящего Договора банковской гарантии, но не ранее даты </xsl:text>
								</xsl:if>
								<!--sup>10</sup-->
								<xsl:text> получения Кредитором оригинала и копии одного из документов, указанных в пункте 2.1.5 настоящего Договора, и действует в течение 10 (десяти) лет.</xsl:text>
								<br/>
								<xsl:text>4.2. Действие настоящего Договора продлевается на тех же условиях на каждые последующие 10 (десять) лет, если за 6 (шесть) месяцев до окончания срока действия настоящего Договора ни одна из Сторон не уведомит другую Сторону о намерении прекратить его действие.</xsl:text>
								<br/>
								<xsl:text>4.3. Действие конкретного Дополнения может быть досрочно прекращено по соглашению Сторон при отсутствии у Должника по такому Дополнению не исполненной в установленный срок обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов в случаях, указанных в пункте 13 статьи 399 Кодекса<!-- (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза» (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)--> и (или) пункте 23 статьи 436 Кодекса<!-- (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза» (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843)-->, и при соблюдении условий, установленных пунктом 25 статьи 436 Кодекса и (или) частью 7 статьи 57 Федерального закона<!-- (Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082)--> (в зависимости от обязанностей, указанных в Дополнении, обеспечивающем обязательства такого Должника).</xsl:text>
								<br/>
								<xsl:text>4.4. В случае направления Кредитором в соответствии с пунктом 2.4.4 настоящего Договора уведомления Поручителю настоящий Договор считается расторгнутым по истечении 10 (десяти) рабочих дней со дня получения Поручителем соответствующего уведомления.</xsl:text>
								<br/>
								<xsl:text>4.5. Настоящий Договор может быть расторгнут досрочно по соглашению Сторон в случае отсутствия действующих Дополнений и при отсутствии у всех Должников, чьи обязательства обеспечивались настоящим Договором, не исполненной в установленный срок обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов в случаях, указанных в пункте 13 статьи 399 Кодекса и (или) пункте 23 статьи 436 Кодекса, и при соблюдении условий, установленных пунктом 25 статьи 436 Кодекса и (или) частью 7 статьи 57 Федерального закона (в зависимости от обязанностей, указанных в Дополнении, обеспечивающем обязательства такого Должника).</xsl:text>
							</div>
							<!-- Прочие условия -->
							<div style="text-align: justify">
								<p align="center" class="head">V. Прочие условия</p>
								<br/>
								<xsl:text>5.1. Настоящий Договор, внесение в него изменений и (или) Дополнений могут заключаться в виде документа на бумажном носителе или электронного документа, подписанного усиленными квалифицированными электронными подписями Сторон (уполномоченных представителей Сторон). Юридически значимые сообщения в рамках договора поручительства могут направляться Сторонами в виде документа на бумажном носителе или электронного документа, подписанного усиленной квалифицированной электронной подписью Стороны (уполномоченного представителя Стороны). Настоящий Договор, внесения в него изменений и (или) Дополнений имеют юридическую силу после их подписания.</xsl:text>
								<br/>
								<xsl:text>5.2. Срок действия заключаемых Дополнений должен истекать не позднее чем за 1 (один) месяц до дня истечения срока действия настоящего Договора.</xsl:text>
								<br/>
								<xsl:text>5.3. Стороны информируют друг друга о лицах, имеющих полномочия на подписание Дополнений, посредством представления сопроводительным письмом копий документов, подтверждающих такие полномочия, заверенных соответствующей Стороной.</xsl:text>
								<br/>
								<xsl:text>5.4. Действия, предусмотренные пунктами 2.4.1, 2.4.2</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, 2.4.5</xsl:text>
								</xsl:if>
								<!--sup>11</sup-->
								<xsl:text> настоящего Договора, в соответствии с частью 2 статьи 76 Федерального закона вправе совершать таможенный орган Российской Федерации, осуществляющий взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней.</xsl:text>
								<br/>
								<xsl:text>5.5. Споры по настоящему Договору разрешаются Сторонами путем переговоров. В случае невозможности урегулирования спора путем переговоров он передается на рассмотрение в суд.</xsl:text>
								<br/>
								<xsl:text>5.6. Настоящий Договор составлен в 2-х экземплярах, имеющих одинаковую юридическую силу:</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Кредитора;</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Поручителя.</xsl:text>
							</div>
							<!-- Адреса и реквизиты Сторон -->
							<div>
								<p align="center" class="head">VI. Адреса и реквизиты Сторон</p>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td>
												<xsl:text>Кредитор:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Creditor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Creditor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Creditor/cat_ru:ShortName and not(gc:Creditor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Creditor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:Address">
															<xsl:for-each select="cat_ru:PostalCode | cat_ru:CounryName | cat_ru:Region | cat_ru:City | cat_ru:StreetHouse | cat_ru:TerritoryCode">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Поручитель:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Guarantor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Guarantor/cat_ru:ShortName and not(gc:Guarantor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Guarantor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='1']">
															<xsl:for-each select="RUScat_ru:PostalCode | RUScat_ru:CounryName | RUScat_ru:Region | RUScat_ru:District | RUScat_ru:Town | RUScat_ru:City | RUScat_ru:StreetHouse | RUScat_ru:House | RUScat_ru:Room | RUScat_ru:AddressText">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<table style="page-break-inside: avoid;">
													<tbody>
														<tr>
															<td width="50%">
																<xsl:text>от Кредитора</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Creditor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
															<td width="50%">
																<xsl:text>от Поручителя</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Guarantor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Примечания -->
							<!--div class="descr" style="text-align: justify">
								<hr/>
								<sup>1</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>2</sup>
								<xsl:text>, </xsl:text>
								<sup>3</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>4</sup>
								<xsl:text>, </xsl:text>
								<sup>5</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>6</sup>
								<xsl:text>, </xsl:text>
								<sup>7</sup>
								<xsl:text> Абзац включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>8</sup>
								<xsl:text>, </xsl:text>
								<sup>9</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>10</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>11</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
							</div-->
						</div>
						<!--div class="page">
							--><!-- Шапка --><!--
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Дополнение</xsl:text>
											<br/>
											<xsl:text>к Договору поручительства, обеспечивающему в отношении</xsl:text>
											<br/>
											<xsl:text>нескольких лиц исполнение обязанностей юридического лица,</xsl:text>
											<br/>
											<xsl:text>осуществляющего деятельность в сфере таможенного дела,</xsl:text>
											<br/>
											<xsl:text> и (или) исполнение обязанностей уполномоченного экономического</xsl:text>
											<br/>
											<xsl:text>оператора, от </xsl:text>
											<xsl:call-template name="russian_date_month">
												<xsl:with-param name="dateIn" select="gc:GuaranteeContractDate"/>
											</xsl:call-template>
											<xsl:text>, заключенному</xsl:text>
											<br/>
											<xsl:text>между</xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
														<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:text>(</xsl:text>
													<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
													<xsl:text>)</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template>
											<xsl:text> и </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование поручителя)'"/>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template></b>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>
											<xsl:choose>
												<xsl:when test="gc:StatusDetails/gc:Status='0' or gc:StatusDetails/gc:Status='f' or gc:StatusDetails/gc:Status='false'">
													<u>
														<xsl:text>новый</xsl:text>
													</u>
												</xsl:when>
												<xsl:when test="gc:StatusDetails/gc:Status='1' or gc:StatusDetails/gc:Status='t' or gc:StatusDetails/gc:Status='true'">
													<u>
														<xsl:text>заключен</xsl:text>
													</u>
												</xsl:when>
											</xsl:choose>
										</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="gc:StatusDetails/gc:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							--><!-- Основная информация --><!--
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с другой стороны, вместе именуемые «Стороны», заключили настоящее Дополнение к Договору поручительства, обеспечивающему в отношении нескольких лиц исполнение обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и (или) исполнение обязанностей уполномоченного экономического оператора, от </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:GuaranteeContractDate"/>
								</xsl:call-template>
								<xsl:text>, заключенному между</xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование поручителя)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> (далее - Договор поручительства), о нижеследующем:</xsl:text>
							</div>
							--><!-- Пункты договора --><!--
							<div style="text-align: justify">
								<xsl:text>1. В соответствии с пунктами 1.1 и 1.2 Договора поручительства Поручитель обеспечивает перед Кредитором исполнение </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='1'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='2'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного перевозчика</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='3'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя и таможенного перевозчика</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='4'">
										<xsl:text>обязанностей уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='5'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя, и обязанности уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='6'">
										<xsl:text>обязанности юридического лица, осуществляющего деятельность в качестве таможенного перевозчика, и обязанности уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='7'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя, таможенного перевозчика, и обязанности уполномоченного экономического оператора</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='8'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца свободного склада</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='9'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца склада временного хранения</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='10'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца таможенного склада</xsl:text>
									</xsl:when>
									<xsl:when test="gc:Debtor/gc:ActivitiesKindDetails='11'">
										<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца магазина беспошлинной торговли</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="gc:Debtor/gc:ActivitiesKindDetails"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> в отношении </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="gc:Debtor"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование юридического лица, осуществляющего деятельность (претендующего на осуществление деятельности) в сфере таможенного дела, и (или) включенного (претендующего на включение) в реестр уполномоченных экономических операторов, адрес, указанный в Едином государственном реестре юридических лиц, идентификационный номер налогоплательщика, банковские реквизиты, адрес свободного склада, таможенного склада, склада временного хранения или магазина беспошлинной торговли (только для указанной деятельности))'"/>
									<xsl:with-param name="width" select="'100%'"/>
								</xsl:call-template>
								<br/>
								<xsl:text>в том числе таких обязанностей, которые могут возникнуть в будущем, в сумме не более </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:ObligationAmount"/>
										<xsl:if test="gc:ObligationAmountText">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="gc:ObligationAmountText"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(цифрами и прописью)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> рублей.</xsl:text>
								<br/>
								<xsl:text>2. Настоящее Дополнение составлено в двух экземплярах, имеющих одинаковую юридическую силу, по одному экземпляру для каждой из Сторон.</xsl:text>
								<br/>
								<xsl:text>3. Настоящее Дополнение вступает в силу с </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:GuaranteeContractDate"/>
								</xsl:call-template>
								<xsl:text> и действует до </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:ValidityDate"/>
								</xsl:call-template>
								<xsl:text> включительно.</xsl:text>
							</div>
							--><!-- Адреса и реквизиты Сторон --><!--
							<div>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td width="50%">
												<xsl:text>от Кредитора</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												<xsl:text>   </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="gc:Creditor/gc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<xsl:text>м.п. (при наличии)</xsl:text>
											</td>
											<td width="50%">
												<xsl:text>от Поручителя</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												<xsl:text>   </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="gc:Guarantor/gc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<xsl:text>м.п. (при наличии)</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div-->
					</xsl:when>
					<xsl:when test="gc:GuaranteeContractKind='4'">
						<div class="page">
							<!-- Шапка -->
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Договор</xsl:text>
											<br/>
											<xsl:text>поручительства, обеспечивающий в отношении нескольких лиц</xsl:text>
											<br/>
											<xsl:text>исполнение обязанности по уплате таможенных пошлин,</xsl:text>
											<br/>
											<xsl:text>налогов, таможенных сборов, специальных,</xsl:text>
											<br/>
											<xsl:text>антидемпинговых, компенсационных пошлин</xsl:text></b>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>
											<xsl:choose>
												<xsl:when test="gc:StatusDetails/gc:Status='0' or gc:StatusDetails/gc:Status='f' or gc:StatusDetails/gc:Status='false'">
													<u>
														<xsl:text>новый</xsl:text>
													</u>
												</xsl:when>
												<xsl:when test="gc:StatusDetails/gc:Status='1' or gc:StatusDetails/gc:Status='t' or gc:StatusDetails/gc:Status='true'">
													<u>
														<xsl:text>заключен</xsl:text>
													</u>
												</xsl:when>
											</xsl:choose>
										</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="gc:StatusDetails/gc:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							<!-- Основная информация -->
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<!--xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text-->
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с другой стороны, вместе именуемые «Стороны», заключили настоящий Договор на основании статьи 63 Таможенного кодекса Евразийского экономического союза <!-- (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843) -->(Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза», далее - Кодекс), статей 62 и 76 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» <!--(Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082; № 49, ст. 7524) -->(далее - Федеральный закон), статьи 6 Федерального закона от 6 апреля 2011 г. № 63-ФЗ «Об электронной подписи»<!-- (Собрание законодательства Российской Федерации, 2011, № 15, ст. 2036; 2016, № 26, ст. 3889)-->, статей 361 - 367 Гражданского кодекса Российской Федерации <!--(Собрание законодательства Российской Федерации, 1994, № 32, ст. 3301; 2015, № 10, ст. 1412) -->о нижеследующем.</xsl:text>
							</div>
							<!-- Предмет договора -->
							<div style="text-align: justify">
								<p align="center" class="head">I. Предмет Договора</p>
								<br/>
								<xsl:text>1.1. По настоящему Договору Поручитель обеспечивает перед Кредитором в отношении нескольких лиц, именуемых в дальнейшем «Должник», исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, в том числе такой обязанности, которая может возникнуть в будущем.</xsl:text>
								<br/>
								<xsl:text>1.2. Должник и размеры денежных обязательств Поручителя за каждого Должника указываются в дополнениях к настоящему Договору (далее - Дополнение), которые являются его неотъемлемой частью.</xsl:text>
								<br/>
								<xsl:text>1.3. Размер финансовых обязательств Поручителя по конкретному Дополнению уменьшается на суммы платежей, осуществленных Поручителем</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, суммы денежных средств, взысканных по банковской гарантии</xsl:text>
								</xsl:if>
								<!--sup>1</sup-->
								<xsl:text>, и суммы денежных средств, списанных с банковского счета Поручителя, в случае неисполнения или ненадлежащего исполнения Должником обязанности, указанной в пункте 1.1 настоящего Договора.</xsl:text>
							</div>
							<!-- Взаимодействие сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">II. Взаимодействие Сторон</p>
								<br/>
								<xsl:text>2.1. Обязанности Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.1.1. Отвечать перед Кредитором солидарно с Должниками при неисполнении или ненадлежащем исполнении Должниками обязанности, указанной в пункте 1.1 настоящего Договора, в размере денежных обязательств, указанных в Дополнениях к настоящему Договору, и обеспеченной поручительством в соответствии с настоящим Договором.</xsl:text>
								<br/>
								<xsl:text>2.1.2. Уплатить суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов в случаях, когда у Должника в соответствии с актами, составляющими право Евразийского экономического союза и (или) законодательством Российской Федерации, возникает обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов либо указанный Должник несет солидарную обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, процентов, пеней с плательщиком таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин в течение 5 (пяти) рабочих дней со дня получения требования об уплате денежной суммы по договору поручительства (далее - Требование), направленного таможенным органом Российской Федерации, осуществляющим взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней, на банковский счет, указанный в Требовании, при неисполнении или ненадлежащем исполнении конкретным Должником обязанности, указанной в пункте 1.1 настоящего Договора в размере денежных обязательств, указанных в Дополнениях к настоящему Договору, и обеспеченной поручительством в соответствии с настоящим Договором.</xsl:text>
								<br/>
								<xsl:text>2.1.3. Уплатить суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, на банковский счет, указанный в Требовании, в случае отклонения таможенным органом Российской Федерации, направившим Требование, возражений, представленных Поручителем в соответствии с пунктом 2.2.1 настоящего Договора, в течение 1 (одного) рабочего дня с момента получения повторного Требования.</xsl:text>
								<br/>
								<xsl:text>2.1.4. Предоставить таможенным органам Российской Федерации право на списание денежных средств с банковского счета Поручителя, включив в договор банковского счета между Поручителем и кредитной организацией, в которой Поручителю открыт банковский счет, право таможенных органов Российской Федерации предъявлять соответствующие распоряжения к указанному банковскому счету.</xsl:text>
								<br/>
								<xsl:text>2.1.5. Представить Кредитору одновременно оригинал и копию договора банковского счета или дополнительного соглашения к договору банковского счета, содержащего положения о праве таможенных органов Российской Федерации, указанном в пункте 2.1.4 настоящего Договора. Таможенный орган Российской Федерации проверяет соответствие копии представленного документа его оригиналу, после чего оригинал документа возвращается Поручителю.</xsl:text>
								<br/>
								<xsl:text>2.1.6. Информировать Кредитора о закрытии банковского счета в кредитной организации, указанного в пункте 2.1.4 настоящего Договора, с одновременным представлением одного из документов, предусмотренных пунктом 2.1.5 настоящего Договора, по иному банковскому счету Поручителя.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.1.7. Обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии, выданной банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, по которой бенефициаром выступает Кредитор, в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору, путем представления Кредитору оригинала указанной банковской гарантии</xsl:text>
									<!--sup>2</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.8. Представляемая банковская гарантия должна являться безотзывной и содержать условие об обеспечении обязательств Поручителя по настоящему Договору. Обязательства Поручителя по настоящему Договору должны обеспечиваться непрерывно в течение всего срока действия настоящего Договора</xsl:text>
									<!--sup>3</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.1.9. Если по истечении срока действия настоящего Договора Поручитель оспаривает Требование, представленное в период срока действия настоящего Договора, на период рассмотрения спора Поручитель предоставляет Кредитору банковскую гарантию в размере, указанном в Требовании</xsl:text>
									<!--sup>4</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.2. Права Поручителя:</xsl:text>
								<br/>
								<xsl:text>2.2.1. Выдвигать против Требования возражения, которые мог бы представить Должник, в пределах срока, указанного в пункте 2.1.2 настоящего Договора.</xsl:text>
								<br/>
								<br/>
								<xsl:text>2.3. Обязанности Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.3.1. Обеспечить передачу Поручителю в течение 10 (десяти) рабочих дней после исполнения им обязанности, указанной в пункте 1.1 настоящего Договора, по Дополнению, обеспечивающему обязанность конкретного Должника, документов, удостоверяющих требование к Должнику, на основании которых Поручитель может предъявить к Должнику регрессное требование.</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.3.2. Принимать от Поручителя банковскую гарантию, выданную банком, включенным в реестр банков, обладающих правом выдачи банковских гарантий, государственной корпорацией развития «ВЭБ.РФ» или Евразийским банком развития, если условия такой банковской гарантии обеспечивают надлежащим образом обязательства Поручителя, а ее условия соответствуют положениям законодательства Российской Федерации и настоящего Договора</xsl:text>
									<!--sup>5</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
								<br/>
								<br/>
								<xsl:text>2.4. Права Кредитора:</xsl:text>
								<br/>
								<xsl:text>2.4.1. Направить Поручителю Требование при неисполнении или ненадлежащем исполнении конкретным Должником обязанности, указанной в пункте 1.1 настоящего Договора, по Дополнению, обеспечивающему обязанность такого Должника.</xsl:text>
								<br/>
								<xsl:text>2.4.2. Предъявить инкассовые поручения к банковскому счету Поручителя, указанному в пункте 2.1.4 настоящего Договора, на списание с указанного счета сумм таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:CollOrderReason='1'">если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:when>
									<xsl:otherwise>в случае невозможности взыскания таких сумм по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора.</xsl:otherwise>
								</xsl:choose>
								<br/>
								<xsl:text>2.4.3. Не заключать новые Дополнения в случаях:</xsl:text>
								<xsl:if test="gc:CollOrderReason = 1">
									<br/>
									<xsl:text>– несоответствия Поручителя критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона, - до даты, когда Поручитель будет соответствовать таким критериям</xsl:text>
									<!--sup>6</sup-->
									<xsl:text>;</xsl:text>
								</xsl:if>
								<br/>
								<xsl:text>– неисполнения Поручителем Требования или не поступления от него возражений в срок, установленный пунктом 2.1.2 настоящего Договора, а также не исполнения Поручителем повторного Требования в срок, установленный пунктом 2.1.3 настоящего Договора, - до прекращения в соответствии с актами, составляющими право Евразийского экономического союза и (или) законодательством Российской Федерации у Должника обязанности (солидарной обязанности) по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, указанной в Требовании (повторном Требовании);</xsl:text>
								<br/>
								<xsl:text>– неисполнения Поручителем обязанности, предусмотренной пунктом 2.1.6 настоящего Договора, - до представления одного из документов, предусмотренных пунктом 2.1.5 настоящего Договора, по иному банковскому счету Поручителя</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>;</xsl:text>
									<br/>
									<xsl:text>– необеспечения Поручителем надлежащего исполнения своих обязательств перед таможенными органами Российской Федерации в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору, - до представления в соответствии с пунктом 2.1.7 настоящего Договора банковской гарантии</xsl:text>
									<!--sup>7</sup-->
								</xsl:if>
								<xsl:text>.</xsl:text>
								<br/>
								<xsl:text>2.4.4. Расторгнуть настоящий Договор в одностороннем порядке посредством уведомления Поручителя в случае, когда прекратилось действие всех Дополнений, заключенных в период действия настоящего Договора, и </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:ReasonForTerminatingContract='1'">хотя бы по одному такому Дополнению обязанность (солидарная обязанность) по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, указанная в Требовании, не была прекращена в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, по истечении 3 (трех) месяцев со дня направления такого Требования.</xsl:when>
									<xsl:otherwise>Поручителем в общей сложности в течение более 3 (трех) месяцев не обеспечено надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в размере не менее принимаемых Поручителем на себя обязательств по настоящему Договору.</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="gc:CollOrderReason!='1'">
									<br/>
									<xsl:text>2.4.5. Взыскать суммы таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов, подлежащих уплате в соответствии с актами, составляющими право Евразийского экономического союза, и (или) законодательством Российской Федерации о таможенном регулировании, по банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование</xsl:text>
									<!--sup>8</sup-->
									<xsl:text>.</xsl:text>
									<br/>
									<xsl:text>2.4.6. Отказать в приеме банковской гарантии, представленной в соответствии с пунктом 2.1.7 настоящего Договора, с указанием причин отказа, если условия такой банковской гарантии не обеспечивают надлежащим образом обязательства Поручителя, а также не соответствуют положениям законодательства Российской Федерации и (или) настоящего Договора</xsl:text>
									<!--sup>9</sup-->
									<xsl:text>.</xsl:text>
								</xsl:if>
							</div>
							<!-- Ответственность Сторон -->
							<div style="text-align: justify">
								<p align="center" class="head">III. Ответственность Сторон</p>
								<br/>
								<xsl:text>3.1. Поручитель уплачивает неустойку в размере 0,1 процента суммы, подлежащей уплате, за каждый календарный день просрочки, если в срок, указанный в пункте 2.1.2 настоящего Договора, Поручителем не исполнено Требование и не представлены возражения, а также если в срок, указанный в пункте 2.1.3 настоящего Договора, Поручителем не исполнено повторное Требование.</xsl:text>
								<br/>
								<xsl:text>3.2. Уплата неустойки не освобождает Поручителя от исполнения обязательств по настоящему Договору.</xsl:text>
							</div>
							<!-- Срок действия Договора -->
							<div style="text-align: justify">
								<p align="center" class="head">IV. Срок действия Договора</p>
								<br/>
								<xsl:text>4.1. Настоящий Договор вступает в силу с даты</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text> предоставления Кредитору в соответствии с пунктом 2.1.7 настоящего Договора банковской гарантии, но не ранее даты </xsl:text>
								</xsl:if>
								<!--sup>10</sup-->
								<xsl:text> получения Кредитором оригинала и копии одного из документов, указанных в пункте 2.1.5 настоящего Договора, и действует в течение 10 (десяти) лет.</xsl:text>
								<br/>
								<xsl:text>4.2. Действие настоящего Договора продлевается на тех же условиях на каждые последующие 10 (десять) лет, если за 6 (шесть) месяцев до окончания срока действия настоящего Договора ни одна из Сторон не уведомит другую Сторону о намерении прекратить его действие.</xsl:text>
								<br/>
								<xsl:text>4.3. В случае направления Кредитором уведомления Поручителю в соответствии с пунктом 2.4.4 настоящего Договора настоящий Договор считается расторгнутым по истечении 10 (десяти) рабочих дней со дня получения Поручителем соответствующего уведомления.</xsl:text>
								<br/>
								<xsl:text>4.4. Настоящий Договор может быть расторгнут досрочно по соглашению Сторон в случаях, если обязанность по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, исполнение которой обеспечено настоящим Договором, исполнена в полном объеме, прекращена либо не возникла или взамен поручительства предоставлено и принято Кредитором другое обеспечение.</xsl:text>
							</div>
							<!-- Прочие условия -->
							<div style="text-align: justify">
								<p align="center" class="head">V. Прочие условия</p>
								<br/>
								<xsl:text>5.1. Настоящий Договор, внесение в него изменений и (или) Дополнений могут заключаться в виде документа на бумажном носителе или электронного документа, подписанного усиленными квалифицированными электронными подписями Сторон (уполномоченных представителей Сторон). Юридически значимые сообщения в рамках настоящего Договора могут направляться Сторонами в виде документа на бумажном носителе или электронного документа, подписанного усиленной квалифицированной электронной подписью Стороны (уполномоченного представителя Стороны). Настоящий Договор, внесения в него изменений и (или) Дополнений имеют юридическую силу после их подписания.</xsl:text>
								<br/>
								<xsl:text>5.2. Поручитель информирует Кредитора о лицах, имеющих полномочия на подписание Дополнений посредством представления сопроводительным письмом копий документов, подтверждающих такие полномочия, заверенных соответствующей Стороной.</xsl:text>
								<br/>
								<xsl:text>5.3. Действия, предусмотренные пунктами 2.4.1, 2.4.2</xsl:text>
								<xsl:if test="gc:CollOrderReason!='1'">
									<xsl:text>, 2.4.5 </xsl:text>
								</xsl:if>
								<!--sup>11</sup-->
								<xsl:text> настоящего Договора, в соответствии с частью 2 статьи 76 Федерального закона вправе совершать таможенный орган Российской Федерации, осуществляющий взыскание таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней.</xsl:text>
								<br/>
								<xsl:text>5.4. Споры по настоящему Договору разрешаются Сторонами путем переговоров. В случае невозможности урегулирования спора путем переговоров он передается на рассмотрение в суд.</xsl:text>
								<br/>
								<xsl:text>5.5. Настоящий Договор составлен в 2-х экземплярах, имеющих одинаковую юридическую силу:</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Кредитора;</xsl:text>
								<br/>
								<xsl:text>один экземпляр - у Поручителя.</xsl:text>
							</div>
							<!-- Адреса и реквизиты Сторон -->
							<div>
								<p align="center" class="head">VI. Адреса и реквизиты Сторон</p>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td>
												<xsl:text>Кредитор:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Creditor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Creditor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Creditor/cat_ru:ShortName and not(gc:Creditor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Creditor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:Address">
															<xsl:for-each select="cat_ru:PostalCode | cat_ru:CounryName | cat_ru:Region | cat_ru:City | cat_ru:StreetHouse | cat_ru:TerritoryCode">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Creditor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Creditor/cat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Поручитель:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="gc:Guarantor/cat_ru:OrganizationName">
															<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="gc:Guarantor/cat_ru:ShortName and not(gc:Guarantor/cat_ru:OrganizationName)">
															<xsl:value-of select="gc:Guarantor/cat_ru:ShortName"/>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Адрес:</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='1']">
															<xsl:for-each select="RUScat_ru:PostalCode | RUScat_ru:CounryName | RUScat_ru:Region | RUScat_ru:District | RUScat_ru:Town | RUScat_ru:City | RUScat_ru:StreetHouse | RUScat_ru:House | RUScat_ru:Room | RUScat_ru:AddressText">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="position()!=last()">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(адрес, указанный в Едином государственном реестре юридических лиц)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>ОГРН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> ИНН: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="comma" select="1"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
												<xsl:text> КПП: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="gc:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'40mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Банковские реквизиты:</xsl:text>
												<br/>
												<xsl:text>р/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:for-each select="cat_ru:BankAccount">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер расчетного счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
												<xsl:text> в </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BankName"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование подразделения Федерального казначейства)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>к/счет: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:CorrAccount"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(номер корреспондентского счета)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>БИК: </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:for-each select="gc:Guarantor/RUScat_ru:BankInformation[cat_ru:BankAccountDescription='расчетный']">
															<xsl:value-of select="cat_ru:BICID"/>
														</xsl:for-each>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(банковский идентификационный код)'"/>
													<xsl:with-param name="width" select="'60mm'"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td>
												<table style="page-break-inside: avoid;">
													<tbody>
														<tr>
															<td width="50%">
																<xsl:text>от Кредитора</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Creditor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
															<td width="50%">
																<xsl:text>от Поручителя</xsl:text>
																<br/>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:text>   </xsl:text>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(подпись)'"/>
																	<xsl:with-param name="width" select="'30mm'"/>
																</xsl:call-template>
																<xsl:text>   </xsl:text>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:apply-templates select="gc:Guarantor/gc:AuthorizedPerson" mode="fio"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'center'"/>
																	<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
																	<xsl:with-param name="width" select="'50mm'"/>
																</xsl:call-template>
																<br/>
																<br/>
																<xsl:text>м.п. (при наличии)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Примечания -->
							<!--div class="descr" style="text-align: justify">
								<hr/>
								<sup>1</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>2</sup>
								<xsl:text>, </xsl:text>
								<sup>3</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>4</sup>
								<xsl:text>, </xsl:text>
								<sup>5</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>6</sup>
								<xsl:text>, </xsl:text>
								<sup>7</sup>
								<xsl:text> Абзац включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>8</sup>
								<xsl:text>, </xsl:text>
								<sup>9</sup>
								<xsl:text> Пункт включается в договор поручительства, если лицо, имеющее намерение стать поручителем, на день заключения договора поручительства не соответствует критериям, определенным Правительством Российской Федерации в соответствии с пунктом 1 части 11 статьи 62 Федерального закона.</xsl:text>
								<br/>
								<sup>10</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
								<br/>
								<sup>11</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
							</div-->
						</div>
						<!--div class="page">
							--><!-- Шапка --><!--
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Дополнение</xsl:text>
											<br/>
											<xsl:text>к Договору поручительства, обеспечивающему в отношении</xsl:text>
											<br/>
											<xsl:text>нескольких лиц исполнение обязанности по уплате таможенных</xsl:text>
											<br/>
											<xsl:text>пошлин, налогов, таможенных сборов, специальных,</xsl:text>
											<br/>
											<xsl:text>антидемпинговых, компенсационных пошлин,</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date_month">
												<xsl:with-param name="dateIn" select="gc:GuaranteeContractDate"/>
											</xsl:call-template>
											<xsl:text>, заключенному между</xsl:text>
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
														<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:text>(</xsl:text>
													<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
													<xsl:text>)</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template>
											<xsl:text> и </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование поручителя)'"/>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template></b>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>
											<xsl:choose>
												<xsl:when test="gc:StatusDetails/gc:Status='0' or gc:StatusDetails/gc:Status='f' or gc:StatusDetails/gc:Status='false'">
													<u>
														<xsl:text>новый</xsl:text>
													</u>
												</xsl:when>
												<xsl:when test="gc:StatusDetails/gc:Status='1' or gc:StatusDetails/gc:Status='t' or gc:StatusDetails/gc:Status='true'">
													<u>
														<xsl:text>заключен</xsl:text>
													</u>
												</xsl:when>
											</xsl:choose>
										</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="gc:StatusDetails/gc:Date"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							--><!-- Основная информация --><!--
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Creditor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Creditor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber or gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gc:Guarantor/gc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение договора поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> с другой стороны, вместе именуемые «Стороны», заключили настоящее Дополнение к Договору поручительства, обеспечивающему в отношении нескольких лиц исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, от </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:GuaranteeContractDate"/>
								</xsl:call-template>
								<xsl:text>, заключенному между</xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:text>(</xsl:text>
										<xsl:value-of select="gc:Creditor/gc:CustomsDetails/cat_ru:Code"/>
										<xsl:text>)</xsl:text>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование поручителя)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> (далее - Договор поручительства), о нижеследующем:</xsl:text>
							</div>
							--><!-- Пункты договора --><!--
							<div style="text-align: justify">
								<xsl:text>1. В соответствии с пунктами 1.1 и 1.2 Договора поручительства Поручитель обеспечивает перед Кредитором исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, в отношении </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="gc:Debtor"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(для организации: наименование, место нахождения и адрес, указанный в Едином государственном реестре юридических лиц, идентификационный номер налогоплательщика (далее - ИНН), банковские реквизиты; для физического лица: фамилия, имя, отчество (при наличии), наименование документа, удостоверяющего личность, серия и номер такого документа, место жительства, ИНН (при наличии); основной государственный регистрационный номер индивидуального предпринимателя (для лиц, осуществляющих деятельность в качестве индивидуального предпринимателя))'"/>
									<xsl:with-param name="width" select="'100%'"/>
								</xsl:call-template>
								<br/>
								<xsl:text>в том числе такой обязанности, которая может возникнуть в будущем, по </xsl:text>
								<xsl:choose>
									<xsl:when test="gc:Debtor/gc:DocKind='1'">транзитная декларация</xsl:when>
									<xsl:when test="gc:Debtor/gc:DocKind='2'">декларация на товары</xsl:when>
									<xsl:otherwise>
										<u>
											<xsl:value-of select="gc:Debtor/gc:DocKind"/>
										</u>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> № </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:for-each select="gc:Debtor/gc:RegNumberDT">
											<xsl:apply-templates select="." mode="GTDID"/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(регистрационный номер)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<sup>12</sup>
								<xsl:text> в сумме не более </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="gc:ObligationAmount"/>
										<xsl:if test="gc:ObligationAmountText">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="gc:ObligationAmountText"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(цифрами и прописью)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								<xsl:text> рублей.</xsl:text>
								<br/>
								<xsl:text>2. Настоящее Дополнение составлено в двух экземплярах, имеющих одинаковую юридическую силу, по одному экземпляру для каждой из Сторон.</xsl:text>
								<br/>
								<xsl:text>3. Настоящее Дополнение вступает в силу с </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:GuaranteeContractDate"/>
								</xsl:call-template>
								<xsl:text> и действует до </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="gc:ValidityDate"/>
								</xsl:call-template>
								<xsl:text> включительно.</xsl:text>
							</div>
							--><!-- Адреса и реквизиты Сторон --><!--
							<div>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td width="50%">
												<xsl:text>от Кредитора</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												<xsl:text>   </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="gc:Creditor/gc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<xsl:text>м.п. (при наличии)</xsl:text>
											</td>
											<td width="50%">
												<xsl:text>от Поручителя</xsl:text>
												<br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												<xsl:text>   </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="gc:Guarantor/gc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<xsl:text>м.п. (при наличии)</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							--><!-- Примечания --><!--
							<div class="descr" style="text-align: justify">
								<hr/>
								<sup>12</sup>
								<xsl:text> Указывается с учетом наличия (отсутствия) у лица, имеющего намерение стать поручителем, обязанности обеспечить надлежащее исполнение своих обязательств перед таможенными органами Российской Федерации в форме банковской гарантии.</xsl:text>
							</div>
						</div-->
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>

	<!--Шаблон для типа gc:Debtor-->
	<xsl:template match="gc:Debtor">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text>, ИНН - </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:text>, ОГРН/ОГРНИП - </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text>, </xsl:text>
			<xsl:choose>
				<xsl:when test="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
					<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:FullIdentityCardName"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> серия </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/>
			<xsl:text> номер </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="RUScat_ru:AddressKindCode='1'">адрес регистрации</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='2'">фактический адрес</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='3'">почтовый адрес</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> - </xsl:text>
				<xsl:for-each select="RUScat_ru:PostalCode | RUScat_ru:CounryName | RUScat_ru:Region | RUScat_ru:District | RUScat_ru:Town | RUScat_ru:City | RUScat_ru:StreetHouse | RUScat_ru:House | RUScat_ru:Room | RUScat_ru:AddressText">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:BankInformation">
			<xsl:text>; банковские реквизиты - </xsl:text>
			<xsl:for-each select="RUScat_ru:BankInformation">
				<xsl:text>тип счета: </xsl:text>
				<xsl:for-each select="cat_ru:BankAccountDescription">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:text>; счет(а): </xsl:text>
				<xsl:for-each select="cat_ru:BankAccount">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="cat_ru:BankName">
					<xsl:text>; банк: </xsl:text>
					<xsl:value-of select="cat_ru:BankName"/>
				</xsl:if>
				<xsl:if test="cat_ru:BankMFO">
					<xsl:text>; МФО банка: </xsl:text>
					<xsl:value-of select="cat_ru:BankMFO"/>
				</xsl:if>
				<xsl:if test="cat_ru:OKPOID">
					<xsl:text>; ОКПО банка: </xsl:text>
					<xsl:value-of select="cat_ru:OKPOID"/>
				</xsl:if>
				<xsl:if test="cat_ru:BICID">
					<xsl:text>; БИК: </xsl:text>
					<xsl:value-of select="cat_ru:BICID"/>
				</xsl:if>
				<xsl:if test="cat_ru:SWIFTID">
					<xsl:text>; SWIFT банка: </xsl:text>
					<xsl:value-of select="cat_ru:SWIFTID"/>
				</xsl:if>
				<xsl:if test="cat_ru:CorrAccount">
					<xsl:text>; к/с банка: </xsl:text>
					<xsl:value-of select="cat_ru:CorrAccount"/>
				</xsl:if>
				<xsl:if test="cat_ru:CorrAccount">
					<xsl:text>; к/с банка: </xsl:text>
					<xsl:value-of select="cat_ru:CorrAccount"/>
				</xsl:if>
				<xsl:if test="cat_ru:TransitCurrencyAccount">
					<xsl:text>; валютный счет организации (транзитный): </xsl:text>
					<xsl:for-each select="cat_ru:TransitCurrencyAccount">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
					<xsl:text>; валютный счет организации (специальный транзитный): </xsl:text>
					<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="*" mode="GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='GuaranteeContract']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>«</xsl:text>
				<span class="value">&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</span>
				<xsl:text>» </xsl:text>
				<span class="value">&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;</span>
					<xsl:text> 20</xsl:text>
				<span class="value">
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</span>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
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
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>