-- 69f38a47be68029e81fbd5cc5beeed2c
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0 )
	f1_arg0:setState( "Collapsed" )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = ""
	local f2_local1 = 0
	if f2_arg1 ~= nil and f2_arg1 ~= "" then
		f2_local0 = Engine.Localize( f2_arg1 )
		f2_local1 = f2_local1 + 1
	end
	if f2_arg2 ~= nil and f2_arg2 ~= "" then
		f2_local0 = f2_local0 .. " + " .. Engine.Localize( f2_arg2 )
		f2_local1 = f2_local1 + 1
	end
	if f2_arg3 ~= nil and f2_arg3 ~= "" then
		f2_local0 = f2_local0 .. " + " .. Engine.Localize( f2_arg3 )
		f2_local1 = f2_local1 + 1
	end
	f2_arg0:setState( "DefaultState" )
	f2_arg0.Attachments:setText( f2_local0 )
	if f2_arg0.collapseTimer ~= nil then
		f2_arg0.collapseTimer:close()
	end
	if f2_local1 > 1 then
		local self = LUI.UITimer.new( 3000, "collapse_to_customized", true, f2_arg0 )
		f2_arg0.collapseTimer = self
		f2_arg0:addElement( self )
	end
end

local PostLoadFunc = function ( f3_arg0 )
	f3_arg0.UpdateAttachments = f0_local1
	f3_arg0:registerEventHandler( "collapse_to_customized", f0_local0 )
end

CoD.ZmAmmo_TextAttachmentInfo = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_TextAttachmentInfo.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_TextAttachmentInfo )
	self.id = "ZmAmmo_TextAttachmentInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 296 )
	self:setTopBottom( true, false, 0, 18 )
	
	local Attachments = LUI.UITightText.new()
	Attachments:setLeftRight( false, true, -115.5, 0 )
	Attachments:setTopBottom( false, true, -20, 0 )
	Attachments:setText( Engine.Localize( "Attachments here" ) )
	Attachments:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Attachments:setLetterSpacing( 0.5 )
	self:addElement( Attachments )
	self.Attachments = Attachments
	
	local WeaponNameStrokeLbl = LUI.UITightText.new()
	WeaponNameStrokeLbl:setLeftRight( false, true, -235.5, -120.5 )
	WeaponNameStrokeLbl:setTopBottom( false, true, -20, 0 )
	WeaponNameStrokeLbl:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WeaponNameStrokeLbl:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	WeaponNameStrokeLbl:setShaderVector( 0, 0, 0, 0, 0 )
	WeaponNameStrokeLbl:setShaderVector( 1, 0, 0, 0, 0 )
	WeaponNameStrokeLbl:setShaderVector( 2, 1, 0, 0, 0 )
	WeaponNameStrokeLbl:setLetterSpacing( 0.5 )
	WeaponNameStrokeLbl:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponName", function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponNameStrokeLbl:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponNameStrokeLbl )
	self.WeaponNameStrokeLbl = WeaponNameStrokeLbl
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Attachments:completeAnimation()
				self.Attachments:setAlpha( 1 )
				self.clipFinished( Attachments, {} )

				WeaponNameStrokeLbl:completeAnimation()
				self.WeaponNameStrokeLbl:setAlpha( 1 )
				self.clipFinished( WeaponNameStrokeLbl, {} )
			end
		},
		Collapsed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Attachments:completeAnimation()
				self.Attachments:setAlpha( 0 )
				self.clipFinished( Attachments, {} )

				WeaponNameStrokeLbl:completeAnimation()
				self.WeaponNameStrokeLbl:setAlpha( 1 )
				self.clipFinished( WeaponNameStrokeLbl, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponNameStrokeLbl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

