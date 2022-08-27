-- 32d6643154c50e64ca3cfed6d132fe0c
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = f1_arg0.centerText:getLocalTopBottom()
	if f1_local0 == 0.5 and f1_local1 == 0.5 then
		local f1_local4, f1_local5, f1_local6, f1_local7 = f1_arg0:getLocalTopBottom()
		local f1_local8 = f1_local7 - f1_local6
		local f1_local9 = f1_local3 - f1_local2
		local f1_local10 = f1_local9 / f1_local8
		local f1_local11 = (f1_local3 + f1_local2) / 2 - 0.2 * f1_local9
		f1_arg0.centerText:setTopBottom( 0.5 - f1_local10 * 0.4, 0.5 + f1_local10 * 0.6, f1_local11, f1_local11 )
	end
end

CoD.MissionRecordVault_AccoladesKills = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_AccoladesKills.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_AccoladesKills )
	self.id = "MissionRecordVault_AccoladesKills"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setRGB( 1, 0.98, 0.59 )
	image:setImage( RegisterImage( "uie_kill" ) )
	self:addElement( image )
	self.image = image
	
	local centerText = LUI.UIText.new()
	centerText:setLeftRight( true, true, 39, -35 )
	centerText:setTopBottom( false, false, -33, -3 )
	centerText:setRGB( 0, 0, 0 )
	centerText:setAlpha( 0 )
	centerText:setTTF( "fonts/escom.ttf" )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	centerText:linkToElementModel( self, "centerText", true, function ( model )
		local _centerText = Engine.GetModelValue( model )
		if _centerText then
			centerText:setText( Engine.Localize( _centerText ) )
		end
	end )
	self:addElement( centerText )
	self.centerText = centerText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.96, 0 )
				self.clipFinished( image, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.centerText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

