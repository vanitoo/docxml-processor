<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:nrcr="urn:customs.ru:Information:CustomsDocuments:NotifRegisterCustRepresentatives:5.24.0">
	<!-- Шаблон для типа NotifRegisterCustRepresentativesType -->
	<xsl:template match="nrcr:NotifRegisterCustRepresentatives">
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
					  /*white-space: normal;*/
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
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
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
				  p{
					margin: 0px;
					text-indent: 4em;
					text-align: justify;
					text-justify: inter-word;
				  }                  
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:choose>
						<xsl:when test="nrcr:NotificationKind = 1">
							<p>
								<xsl:text>ФТС России, рассмотрев заявление </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> (далее - Общество), в соответствии с частью 9 статьи 342 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» (далее - Федеральный закон) подтверждает соблюдение Обществом иных условий включения в реестр таможенных представителей (далее - Реестр).</xsl:text>
							</p>
							<p>
								<xsl:text>В соответствии с частью 11 статьи 342 Федерального закона для включения в Реестр необходимо в срок, не превышающий десяти рабочих дней со дня направления настоящего уведомления, представить в ФТС России документы, подтверждающие наличие обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела.</xsl:text>
							</p>
							<p>
								<xsl:text>Обращаем внимание, что пересчет иностранной валюты, в которой установлен размер обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, в валюту Российской Федерации, согласно подпункту 1 пункта 11 статьи 399 Таможенного кодекса Евразийского экономического союза, производится на день регистрации таможенным органом уведомления о соблюдении иных условий включения в реестр лиц, осуществляющих деятельность в сфере таможенного дела, направляемого юридическому лицу, претендующему на осуществление деятельности в сфере таможенного дела.</xsl:text>
							</p>
							<p>
								<xsl:text>Одновременно информируем, что согласно статье 61 Федерального закона банковская гарантия представляется в таможенный орган в виде документа на бумажном носителе или электронного документа. При этом электронная банковская гарантия представляется в таможенный орган непосредственно банком, ее выдавшим, а срок ее принятия таможенным органом меньше, чем срок принятия банковской гарантии на бумажном носителе (один рабочий день, следующий за днем поступления, и пять рабочих дней со дня поступления соответственно). Также при представлении электронной банковской гарантии отсутствует необходимость представления документов, подтверждающих полномочия лица, ее подписавшего, а также карточки с образцом подписи данного лица и оттиском печати кредитной организации, в то время как представление указанных документов является обязательным при направлении банковской гарантии на бумажном носителе.</xsl:text>
							</p>
							<p>
								<xsl:text>В этой связи предлагаем в случае выбора банковской гарантии в качестве способа обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, представлять в ФТС России банковские гарантии, оформленные в виде электронного документа.</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 2">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> (далее - Общество) включено в реестр таможенных представителей.</xsl:text>
							</p>
							<p>
								<xsl:text>В соответствии с пунктом 93 Административного регламента Федеральной таможенной службы по предоставлению государственной услуги ведения реестра таможенных представителей, утвержденного приказом ФТС России от 30.08.2019 № 1373, Обществу присвоен регистрационный номер таможенного представителя </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:CertificateNumber"/>
									</i>
								</u>
							</p>
							<p>
								<xsl:text>Дополнительно сообщаем, что реестр таможенных представителей ведется ФТС России в электронном виде и публикуется еженедельно на официальном сайте ФТС России в информационно-телекоммуникационной сети «Интернет» (www.customs.gov.ru) в разделе «Участникам ВЭД» → «Таможенный представитель» → «Реестр таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 3">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года в отношении </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> внесены изменения в реестр таможенных представителей.</xsl:text>
							</p>
							<p>
								<xsl:text>Дополнительно сообщаем, что реестр таможенных представителей ведется ФТС России в электронном виде и публикуется еженедельно на официальном сайте ФТС России в информационно-телекоммуникационной сети «Интернет» (www.customs.gov.ru) в разделе «Участникам ВЭД» → «Таможенный представитель» → «Реестр таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 4">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей.</xsl:text>
							</p>
							<p>
								<xsl:text>Дополнительно сообщаем, что реестр таможенных представителей ведется ФТС России в электронном виде и публикуется еженедельно на официальном сайте ФТС России в информационно-телекоммуникационной сети «Интернет» (www.customs.gov.ru) в разделе «Участникам ВЭД» → «Таможенный представитель» → «Реестр таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 5">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей в связи с отсутствием обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, на основании подпункта 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза, частей 1 и 2, пункта 2 части 10 статьи 344 и статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 6">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года в отношении </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> на основании пункта 2 части 11 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», приказа ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей» отменено решение об исключении из реестра таможенных представителей в связи с устранением основания исключения юридического лица из реестра таможенных представителей, установленного подпунктом 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза (предоставление обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела).</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 7">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text>(далее – Общество) исключено из реестра таможенных представителей в связи с неисполнением обязанности таможенного представителя по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин на основании подпункта 2 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза (далее – ТК ЕАЭС), частей 1 и 2, пункта 1 части 10 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».</xsl:text>
							</p>
							<p>
								<xsl:text>Обществом не исполнена обязанность, предусмотренная пунктом 4 статьи 405 ТК ЕАЭС, в срок, указанный в уведомлении(ях) о не уплаченных в установленный срок суммах таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NoticeNotPaidAmounts"/>
									</i>
								</u>
								<xsl:text>, направленном(ых) таможенным органом в соответствии с пунктом 3 статьи 55 ТК ЕАЭС.</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 8">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей в связи с неисполнением обязанности таможенного представителя по представлению в таможенные органы отчетности с использованием информационных технологий в соответствии с законодательством государств – членов Евразийского экономического союза на основании подпункта 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза, пункта 1 части 10 статьи 344 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 9">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года в отношении </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> на основании пункта 1 части 11 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», приказа ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей» отменено решение об исключении из реестра таможенных представителей в связи с устранением основания исключения юридического лица из реестра таможенных представителей, установленного подпунктом 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза (представление отчетности).</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 10">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей в связи с отсутствием договора страхования риска своей гражданской ответственности, которая может наступить вследствие причинения вреда имуществу представляемых лиц или нарушения договоров с этими лицами, на основании подпункта 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза, частей 1 и 2, пункта 1 части 10 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», приказа ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 11">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года в отношении </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> на основании пункта 1 части 11 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», приказа ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей» отменено решение об исключении из реестра таможенных представителей в связи с устранением основания исключения юридического лица из реестра таможенных представителей, установленного подпунктом 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза (предоставление договора страхования риска гражданской ответственности таможенного представителя, которая может наступить вследствие причинения вреда имуществу представляемых лиц или нарушения договоров с этими лицами).</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 12">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей в связи с наличием вступившего(их) в силу и не исполненного(ых) в установленный срок постановления(й) по делу(ам) об административном(ых) правонарушении(ях), ответственность за которое(ые) предусмотрена частью </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:PartCoAP_Article"/>
									</i>
								</u>
								<xsl:text> статьи 16.2 Кодекса Российской Федерации об административных правонарушениях, на основании подпункта 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза, частей 1 и 2, пункта 1 части 10 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», в соответствии с приказом ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 13">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года в отношении </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> на основании пункта 1 части 11 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», приказа ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей» отменено решение об исключении из реестра таможенных представителей в связи с устранением основания исключения юридического лица из реестра таможенных представителей, установленного подпунктом 1 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза (исполнение постановления(й) по делу(ам) об административном(ых) правонарушении(ях)).</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 14">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей в связи с ликвидацией на основании подпункта 4 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза, частей 1 и 3, пункта 3 части 10 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», в соответствии с приказом ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
						<xsl:when test="nrcr:NotificationKind = 15">
							<p>
								<xsl:text>Федеральная таможенная служба сообщает, что решением ФТС России от </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:NotificationDate" mode="russian_date_word"/>
									</i>
								</u>
								<xsl:text> года </xsl:text>
								<u>
									<i>
										<xsl:apply-templates select="nrcr:BusinessEntityTypeName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="nrcr:OrganizationName"/>
									</i>
								</u>
								<xsl:text> исключено из реестра таможенных представителей в связи с реорганизацией на основании подпункта 5 пункта 1 статьи 403 Таможенного кодекса Евразийского экономического союза, частей 1 и 3, пункта 3 части 10 статьи 344, статьи 345 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», в соответствии с приказом ФТС России от 13 декабря 2018 г. № 2037 «Об утверждении порядка действий ФТС России по исключению юридических лиц из реестра таможенных представителей».</xsl:text>
							</p>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="nrcr:NoticeNotPaidAmounts">
		<xsl:if test="position() = 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:if test="position() != 1">,</xsl:if>
		<xsl:if test="nrcr:DocDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="nrcr:DocDate" mode="russian_date"/>
		</xsl:if>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="nrcr:DocNumber"/>
	</xsl:template>
	<xsl:template match="nrcr:DocNumber">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_word">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text> </xsl:text>
				<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
				<xsl:choose>
					<xsl:when test="$month = '01'">января</xsl:when>
					<xsl:when test="$month = '02'">февраля</xsl:when>
					<xsl:when test="$month = '03'">марта</xsl:when>
					<xsl:when test="$month = '04'">апреля</xsl:when>
					<xsl:when test="$month = '05'">мая</xsl:when>
					<xsl:when test="$month = '06'">июня</xsl:when>
					<xsl:when test="$month = '07'">июля</xsl:when>
					<xsl:when test="$month = '08'">августа</xsl:when>
					<xsl:when test="$month = '09'">сентября</xsl:when>
					<xsl:when test="$month = '10'">октября</xsl:when>
					<xsl:when test="$month = '11'">ноября</xsl:when>
					<xsl:when test="$month = '12'">декабря</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='NotifRegisterCustRepresentatives']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_word">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_word">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
