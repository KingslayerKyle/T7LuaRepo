local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.progressBar:setShaderVector( 0, f1_arg1, 0, 0, 0 )
	local f1_local0 = f1_arg0.dotStartX + f1_arg1 * f1_arg0.dotMoveX
	f1_arg0.progressDot:setLeftRight( true, false, f1_local0, f1_local0 + f1_arg0.dotWidth )
	f1_arg0.percentText:setText( math.floor( f1_arg1 * 100 + 0.5 ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg2 == 0 then
		f2_arg0:setAlpha( 0 )
		return 
	else
		f2_arg0:setAlpha( 1 )
		f0_local0( f2_arg0, f2_arg2 )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	local f3_local0, f3_local1, f3_local2, f3_local3 = self.progressDot:getLocalRect()
	local f3_local4 = f3_local0
	self.dotWidth = f3_local2 - f3_local0
	f3_local0, f3_local1, f3_local2, f3_local3 = self.progressBar:getLocalRect()
	self.dotStartX = f3_local0
	self.dotMoveX = f3_local4 - f3_local0
	f0_local1( self, controller, 0 )
	self.percentText:linkToElementModel( self, "percent", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local1( self, controller, modelValue )
		else
			f0_local1( self, controller, 0 )
		end
	end )
end

CoD.HackUploadProgress = InheritFrom( LUI.UIElement )
CoD.HackUploadProgress.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HackUploadProgress )
	self.id = "HackUploadProgress"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 113 )
	
	local bkg = LUI.UIImage.new()
	bkg:setLeftRight( true, false, 0, 355.83 )
	bkg:setTopBottom( true, false, 0, 63.73 )
	bkg:setImage( RegisterImage( "uie_img_t7_hud_cp_quifer_hackprogressbkg" ) )
	self:addElement( bkg )
	self.bkg = bkg
	
	local progressBar = LUI.UIImage.new()
	progressBar:setLeftRight( true, false, 35, 264 )
	progressBar:setTopBottom( true, false, 52.5, 56.5 )
	progressBar:setImage( RegisterImage( "uie_img_t7_hud_cp_aquifer_hackprogressbar" ) )
	progressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	progressBar:setShaderVector( 0, 1, 0, 0, 0 )
	progressBar:setShaderVector( 1, 0, 0, 0, 0 )
	progressBar:setShaderVector( 2, 1, 0, 0, 0 )
	progressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local progressDot = LUI.UIImage.new()
	progressDot:setLeftRight( true, false, 260.75, 264.75 )
	progressDot:setTopBottom( true, false, 52.5, 56.5 )
	progressDot:setImage( RegisterImage( "uie_img_t7_hud_cp_aquifer_hackprogressdot" ) )
	self:addElement( progressDot )
	self.progressDot = progressDot
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 39.42, 223.42 )
	title:setTopBottom( true, false, 13, 35 )
	title:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_DISABLING_COMMS" ) )
	title:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	title:setShaderVector( 0, 0, 1, 0, 0 )
	title:setShaderVector( 1, 0.5, 0, 0, 0 )
	title:setShaderVector( 2, 6, -14, 0, 0 )
	title:setShaderVector( 3, 0, 0, 0, 0 )
	title:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( title )
	self.title = title
	
	local transmission = LUI.UITightText.new()
	transmission:setLeftRight( true, false, 33, 105 )
	transmission:setTopBottom( true, false, 70, 86 )
	transmission:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_PROGRESS" ) )
	transmission:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( transmission )
	self.transmission = transmission
	
	local pctSign = LUI.UITightText.new()
	pctSign:setLeftRight( true, false, 194.92, 207.92 )
	pctSign:setTopBottom( true, false, 62, 87 )
	pctSign:setText( Engine.Localize( "%" ) )
	pctSign:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( pctSign )
	self.pctSign = pctSign
	
	local percentText = LUI.UIText.new()
	percentText:setLeftRight( true, false, 140.42, 194.5 )
	percentText:setTopBottom( true, false, 56.5, 104.5 )
	percentText:setText( Engine.Localize( "42" ) )
	percentText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( percentText )
	self.percentText = percentText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

