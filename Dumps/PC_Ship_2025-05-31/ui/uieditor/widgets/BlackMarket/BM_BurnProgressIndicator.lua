CoD.BM_BurnProgressIndicator = InheritFrom( LUI.UIElement )
CoD.BM_BurnProgressIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BurnProgressIndicator )
	self.id = "BM_BurnProgressIndicator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 476 )
	self:setTopBottom( true, false, 0, 25 )
	
	local ProgressBG = LUI.UIImage.new()
	ProgressBG:setLeftRight( true, false, 0, 400 )
	ProgressBG:setTopBottom( true, false, 0, 25 )
	self:addElement( ProgressBG )
	self.ProgressBG = ProgressBG
	
	local Processed = LUI.UITightText.new()
	Processed:setLeftRight( true, false, 414, 476 )
	Processed:setTopBottom( true, false, 0, 25 )
	Processed:setAlpha( 0 )
	Processed:setTTF( "fonts/default.ttf" )
	Processed:subscribeToGlobalModel( controller, "BurnDupeProgress", "progressString", function ( model )
		local progressString = Engine.GetModelValue( model )
		if progressString then
			Processed:setText( Engine.Localize( progressString ) )
		end
	end )
	self:addElement( Processed )
	self.Processed = Processed
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, false, 1, 399 )
	ProgressBar:setTopBottom( true, false, 1, 24 )
	ProgressBar:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:subscribeToGlobalModel( controller, "BurnDupeProgress", "fraction", function ( model )
		local fraction = Engine.GetModelValue( model )
		if fraction then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( fraction, 1 ), CoD.GetVectorComponentFromString( fraction, 2 ), CoD.GetVectorComponentFromString( fraction, 3 ), CoD.GetVectorComponentFromString( fraction, 4 ) )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Processed:close()
		element.ProgressBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

