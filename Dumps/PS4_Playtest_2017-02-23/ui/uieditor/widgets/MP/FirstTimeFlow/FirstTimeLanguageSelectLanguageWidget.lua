CoD.FirstTimeLanguageSelectLanguageWidget = InheritFrom( LUI.UIElement )
CoD.FirstTimeLanguageSelectLanguageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FirstTimeLanguageSelectLanguageWidget )
	self.id = "FirstTimeLanguageSelectLanguageWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 79 )
	
	local EnglishLanguageImage = LUI.UIImage.new()
	EnglishLanguageImage:setLeftRight( 0, 0, 0, 408 )
	EnglishLanguageImage:setTopBottom( 0, 0, 0, 80 )
	EnglishLanguageImage:setAlpha( 0 )
	EnglishLanguageImage:setImage( RegisterImage( "uie_loc_choose_language_english" ) )
	self:addElement( EnglishLanguageImage )
	self.EnglishLanguageImage = EnglishLanguageImage
	
	local ArabicLanguageImage = LUI.UIImage.new()
	ArabicLanguageImage:setLeftRight( 0, 0, 11, 341 )
	ArabicLanguageImage:setTopBottom( 0, 0, -6, 87 )
	ArabicLanguageImage:setAlpha( 0 )
	ArabicLanguageImage:setImage( RegisterImage( "uie_loc_choose_language_arabic" ) )
	self:addElement( ArabicLanguageImage )
	self.ArabicLanguageImage = ArabicLanguageImage
	
	local ChineseLanguageImage = LUI.UIImage.new()
	ChineseLanguageImage:setLeftRight( 0, 0, 0, 284 )
	ChineseLanguageImage:setTopBottom( 0, 0, 0, 80 )
	ChineseLanguageImage:setAlpha( 0 )
	ChineseLanguageImage:setImage( RegisterImage( "uie_loc_choose_language_simplifiedchinese" ) )
	self:addElement( ChineseLanguageImage )
	self.ChineseLanguageImage = ChineseLanguageImage
	
	self.resetProperties = function ()
		ChineseLanguageImage:completeAnimation()
		ArabicLanguageImage:completeAnimation()
		EnglishLanguageImage:completeAnimation()
		ChineseLanguageImage:setAlpha( 0 )
		ArabicLanguageImage:setAlpha( 0 )
		EnglishLanguageImage:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Chinese = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ChineseLanguageImage:completeAnimation()
				self.ChineseLanguageImage:setAlpha( 1 )
				self.clipFinished( ChineseLanguageImage, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ArabicLanguageImage:completeAnimation()
				self.ArabicLanguageImage:setAlpha( 1 )
				self.clipFinished( ArabicLanguageImage, {} )
			end
		},
		English = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				EnglishLanguageImage:completeAnimation()
				self.EnglishLanguageImage:setAlpha( 1 )
				self.clipFinished( EnglishLanguageImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Chinese",
			condition = function ( menu, element, event )
				return IsChineseSku() and IsCurrentLanguageEnglish()
			end
		},
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsArabicSku() and IsCurrentLanguageEnglish()
			end
		},
		{
			stateName = "English",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsCurrentLanguageEnglish() then
					f9_local0 = not IsJapaneseSku()
				else
					f9_local0 = false
				end
				return f9_local0
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

