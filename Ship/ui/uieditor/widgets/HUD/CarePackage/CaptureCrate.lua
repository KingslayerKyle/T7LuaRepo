-- 44d7e61f252e21a059c623102e5238b2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f1_local0, "hudItems.captureCrateState" ) then
		Engine.CreateModel( f1_local0, "hudItems.captureCrateState" )
	end
	if not Engine.GetModel( f1_local0, "hudItems.captureCrateTotalTime" ) then
		Engine.CreateModel( f1_local0, "hudItems.captureCrateTotalTime" )
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:subscribeToGlobalModel( f2_arg1, "HUDItems", "captureCrateTotalTime", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue <= 0 then
				f2_arg0.bar:setShaderVector( 0, 0, 0, 0, 0 )
				if f2_arg0.bar.updateTimer then
					f2_arg0.bar.updateTimer:close()
					f2_arg0.bar.updateTimer = nil
				end
			else
				f2_arg0.bar.curProgress = 0
				f2_arg0.bar.startTime = Engine.CurrentGameTime()
				f2_arg0.bar.updateTimer = LUI.UITimer.newElementTimer( 16, false, function ()
					local f4_local0 = Engine.CurrentGameTime()
					f2_arg0.bar.curProgress = f2_arg0.bar.curProgress + f4_local0 - f2_arg0.bar.startTime
					f2_arg0.bar:setShaderVector( 0, f2_arg0.bar.curProgress / modelValue, 0, 0, 0 )
					f2_arg0.bar.startTime = f4_local0
				end )
				f2_arg0.bar:addElement( f2_arg0.bar.updateTimer )
			end
		end
	end )
end

CoD.CaptureCrate = InheritFrom( LUI.UIElement )
CoD.CaptureCrate.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CaptureCrate )
	self.id = "CaptureCrate"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 64 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, false, 3, 296.5 )
	FEButtonPanel0:setTopBottom( true, false, 37, 53 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 3, 297 )
	ImageBorder:setTopBottom( true, false, 37, 53 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( true, true, 5, -5 )
	bar:setTopBottom( false, true, -25, -13 )
	bar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	bar:setShaderVector( 0, 1, 0, 0, 0 )
	bar:setShaderVector( 1, 0, 0, 0, 0 )
	bar:setShaderVector( 2, 1, 0, 0, 0 )
	bar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( bar )
	self.bar = bar
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( true, false, 15, 35 )
	text:setText( Engine.Localize( "KILLSTREAK_CAPTURING_CRATE" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setLetterSpacing( 0.5 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setAlpha( 0 )
				self.clipFinished( ImageBorder, {} )

				bar:completeAnimation()
				self.bar:setAlpha( 0 )
				self.clipFinished( bar, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end
		},
		Capture = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setAlpha( 1 )
				self.clipFinished( ImageBorder, {} )

				bar:completeAnimation()
				self.bar:setRGB( 1, 1, 1 )
				self.bar:setAlpha( 0.95 )
				self.clipFinished( bar, {} )

				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.text:setText( Engine.Localize( "KILLSTREAK_CAPTURING_CRATE" ) )
				self.clipFinished( text, {} )
			end
		},
		Hack = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setAlpha( 1 )
				self.clipFinished( ImageBorder, {} )

				bar:completeAnimation()
				self.bar:setRGB( 0.71, 0.18, 0.13 )
				self.bar:setAlpha( 0.85 )
				self.clipFinished( bar, {} )

				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.text:setText( Engine.Localize( "KILLSTREAK_HACKING_CRATE" ) )
				self.clipFinished( text, {} )
			end
		},
		Disarm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				ImageBorder:completeAnimation()
				self.ImageBorder:setAlpha( 1 )
				self.clipFinished( ImageBorder, {} )

				bar:completeAnimation()
				self.bar:setRGB( 0.04, 0.65, 0.9 )
				self.bar:setAlpha( 0.85 )
				self.clipFinished( bar, {} )

				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.text:setText( Engine.Localize( "KILLSTREAK_SUPPLY_DROP_DISARMING_CRATE" ) )
				self.clipFinished( text, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Capture",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.captureCrateState", CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_CAPTURE )
			end
		},
		{
			stateName = "Hack",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.captureCrateState", CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_HACK )
			end
		},
		{
			stateName = "Disarm",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.captureCrateState", CoD.SupplyDrop.SUPPLY_DROP_CRATE_STATE_DISARM )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.captureCrateState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.captureCrateState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.ImageBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
