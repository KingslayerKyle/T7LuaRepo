CoD.HackingBar = InheritFrom( LUI.UIElement )
CoD.HackingBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HackingBar )
	self.id = "HackingBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 96 )
	
	local BarScanning = LUI.UIImage.new()
	BarScanning:setLeftRight( true, false, 0, 58.5 )
	BarScanning:setTopBottom( true, false, 0, 109 )
	BarScanning:setZRot( 180 )
	BarScanning:setImage( RegisterImage( "uie_t7_hud_blackhat_bar_scanning" ) )
	BarScanning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BarScanning:setShaderVector( 0, 1, 0, 0, 0 )
	BarScanning:setShaderVector( 1, 0, 0, 0, 0 )
	BarScanning:setShaderVector( 3, 0.04, 0, 0, 0 )
	BarScanning:subscribeToGlobalModel( controller, "Blackhat", "perc", function ( model )
		local perc = Engine.GetModelValue( model )
		if perc then
			BarScanning:setShaderVector( 2, BlackhatHackingPercentageShaderValue( controller, CoD.GetVectorComponentFromString( perc, 1 ), CoD.GetVectorComponentFromString( perc, 2 ), CoD.GetVectorComponentFromString( perc, 3 ), CoD.GetVectorComponentFromString( perc, 4 ) ) )
		end
	end )
	self:addElement( BarScanning )
	self.BarScanning = BarScanning
	
	local BarHacking = LUI.UIImage.new()
	BarHacking:setLeftRight( true, false, 0, 58.5 )
	BarHacking:setTopBottom( true, false, 0, 109 )
	BarHacking:setAlpha( 0 )
	BarHacking:setZRot( 180 )
	BarHacking:setImage( RegisterImage( "uie_t7_hud_blackhat_bar_hacking" ) )
	BarHacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BarHacking:setShaderVector( 0, 1, 0, 0, 0 )
	BarHacking:setShaderVector( 1, 0, 0, 0, 0 )
	BarHacking:setShaderVector( 3, 0.03, 0, 0, 0 )
	BarHacking:subscribeToGlobalModel( controller, "Blackhat", "perc", function ( model )
		local perc = Engine.GetModelValue( model )
		if perc then
			BarHacking:setShaderVector( 2, BlackhatHackingPercentageShaderValue( controller, CoD.GetVectorComponentFromString( perc, 1 ), CoD.GetVectorComponentFromString( perc, 2 ), CoD.GetVectorComponentFromString( perc, 3 ), CoD.GetVectorComponentFromString( perc, 4 ) ) )
		end
	end )
	self:addElement( BarHacking )
	self.BarHacking = BarHacking
	
	local BarBreaching = LUI.UIImage.new()
	BarBreaching:setLeftRight( true, false, 0, 58.5 )
	BarBreaching:setTopBottom( true, false, 0, 109 )
	BarBreaching:setAlpha( 0 )
	BarBreaching:setZRot( 180 )
	BarBreaching:setImage( RegisterImage( "uie_t7_hud_blackhat_bar_breaching" ) )
	BarBreaching:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BarBreaching:setShaderVector( 0, 1, 0, 0, 0 )
	BarBreaching:setShaderVector( 1, 0, 0, 0, 0 )
	BarBreaching:setShaderVector( 3, 0.03, 0, 0, 0 )
	BarBreaching:subscribeToGlobalModel( controller, "Blackhat", "perc", function ( model )
		local perc = Engine.GetModelValue( model )
		if perc then
			BarBreaching:setShaderVector( 2, BlackhatHackingPercentageShaderValue( controller, CoD.GetVectorComponentFromString( perc, 1 ), CoD.GetVectorComponentFromString( perc, 2 ), CoD.GetVectorComponentFromString( perc, 3 ), CoD.GetVectorComponentFromString( perc, 4 ) ) )
		end
	end )
	self:addElement( BarBreaching )
	self.BarBreaching = BarBreaching
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BarScanning:completeAnimation()
				self.BarScanning:setAlpha( 0 )
				self.clipFinished( BarScanning, {} )
				BarHacking:completeAnimation()
				self.BarHacking:setAlpha( 1 )
				self.BarHacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.BarHacking:setShaderVector( 0, 1, 0, 0, 0 )
				self.BarHacking:setShaderVector( 1, 0, 0, 0, 0 )
				self.BarHacking:setShaderVector( 3, 0.04, 0, 0, 0 )
				self.clipFinished( BarHacking, {} )
			end
		},
		Breaching = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BarScanning:completeAnimation()
				self.BarScanning:setAlpha( 0 )
				self.clipFinished( BarScanning, {} )
				BarBreaching:completeAnimation()
				self.BarBreaching:setAlpha( 1 )
				self.BarBreaching:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.BarBreaching:setShaderVector( 0, 1, 0, 0, 0 )
				self.BarBreaching:setShaderVector( 1, 0, 0, 0, 0 )
				self.BarBreaching:setShaderVector( 3, 0.04, 0, 0, 0 )
				self.clipFinished( BarBreaching, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hacking",
			condition = function ( menu, element, event )
				return IsBlackhatHacking( controller )
			end
		},
		{
			stateName = "Breaching",
			condition = function ( menu, element, event )
				return IsBlackhatBreaching( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.blackhat.status"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BarScanning:close()
		element.BarHacking:close()
		element.BarBreaching:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

